
function TracePlayer(div_id, view, infoView, traceHandler, traceRef, traceModel, baseURI)
{
	this.baseURI = baseURI;
	this.div_id = div_id;
	this.div = null;
	this.view = view;
	this.infoView = infoView;
	this.traceHandler = traceHandler;
	this.traceRef = traceRef;
	this.traceModel = traceModel;
	this.stream = null;
	this.streaming = false;
	this.firstReceived = false;
	this.buffer = null;
	
	/**
	 * Starts the obsel streaming and playing.
	 */
	this.startStreaming = function()
	{
		if(! this.streaming)
		{
			this.streaming = true;
			this.player.setAutoCenter(true);

			var lki = this.player.getLastKnownId();
			if(lki === null) lki = "";
			
			var lkd = this.player.getLastKnownDate();
			if(lkd === null) lkd = "";
			
			var url = this.baseURI + '/php/feed.php?viewId=' + this.view + '&traceHandler=' + this.traceHandler + '&traceRef=' + this.traceRef + '&traceModel=' + this.traceModel + '&lastKnownId=' + lki + '&lastKnownTime=' + lkd;
			
			if(! this.stream)
			{
				this.stream = pi.comet.get(  
					url,
					parametrizeCallback(function(_response){ this.onStreamElement(_response); }, {scope: this}),
					parametrizeCallback(function(){
						if(this.streaming)
						{
							this.stopStreaming();
							this.startStreaming();
						}
					}, {scope: this})  
				);
			}else{
				this.stream.environment.setUrl(url);
				this.stream.send();
			}
		}
	}

	/**
	 * Callback triggered on the reception of new obsels from the comet stream.
	 */
	this.onStreamElement = function(element)
	{
		// Not so eleguent, but it works and is not expensive
		if(element == '<eot/>')
			this.stopStreaming();
		else if(element != '')
			this.buffer.addObsels('<svg>' + element + '</svg>');
	}
	
	/**
	 * Pauses the streaming and playing ; disconnecting from the source.
	 */
	this.stopStreaming = function()
	{
		if(this.streaming)
		{
			this.streaming = false;
			this.player.setAutoCenter(false);
			this.stream.abort();
		}
	}
	
	/**
	 * Programs a slice tobe loaded into the player.
	 */
	this.loadSlice = function(begin, end)
	{
		$.ajax({
			url: this.baseURI + '/php/slice.php?viewId=' + this.view + '&traceHandler=' + this.traceHandler + '&traceRef=' + this.traceRef + '&traceModel=' + this.traceModel + '&timeStampBegin=' + begin + '&timeStampEnd=' + end,
			context: this,
			success: function(data){
				this.buffer.addObselsXML(data.documentElement);
			},
			async: true
		});
	}
	
	/**
	 * Loads and display the player.
	 */
	this.start = function()
	{
		// Fetch the html div in which our player will be
		this.div = $("#" + div_id)[0];
		
		// Initiate the buffer that will contain the svg elements for obsels 
		this.buffer = new ObselIntervalBuffer(this.baseURI, this.div_id);
		this.buffer.init();
		
		// Initialize the Player UI
		this.player = new Player(this.div, this.baseURI);
		
		// Provide the Player UI with the buffer to display
		this.player.setDisplayedBuffer(this.buffer);
		
		// Trigger the loading of the UI and element displaying
		this.player.load();
		
		// Fetch and use the view informations
		this.getViewInfos();
		this.player.setScale(this.defaultViewScale);
		this.player.setCenter(0); // TODO : parametrize, or set a default as a view information
		this.player.setAutoCenter(false);
		
		/*
		 * Set the behaviors of the UI buttons.
		 */
		this.player.onClickPlay = parametrizeCallback(function()
				{
					this.startStreaming();
				}, {scope: this}
			);
		
		this.player.onClickPause = parametrizeCallback(function()
				{
					this.stopStreaming();
				}, {scope: this}
			);
		
		this.player.onClickMinus = function()
		{
			this.setScale(this.scale * 1.0/1.5);
		};
		
		this.player.onClickPlus = function()
		{
			this.setScale(this.scale*1.5);
		};

		this.player.onMissingData = parametrizeCallback(
			function(beginN, endN)
			{
				this.loadSlice(beginN, endN);
			}, {scope: this}
		);
		
		this.player.onObselClicked = parametrizeCallback(
				function(e, clickedNode)
				{
					$.ajax({
						url: this.baseURI + '/php/obsel.php?viewId=' + this.infoView + '&traceHandler=' + this.traceHandler + '&traceRef=' + this.traceRef + '&traceModel=' + this.traceModel + "&obselId=" + clickedNode.getAttribute('obsel-id'),
						context: this,
						success: function(data){
							this.player.infosDiv.innerHTML = data;
						},
						async: true,
						dataType: "html"
					});
					
				}, {scope: this}
			);
	}
	
	/**
	 * Loads the view informations from the server (for now, only the default view scale).
	 */
	this.getViewInfos = function()
	{
		this.defaultViewScale = null;
		$.ajax({
			url: this.baseURI + '/php/getViewInfos.php?viewId=' + this.view,
			context: this,
			success: function(data){
				this.defaultViewScale = data.getElementsByTagName('default-scale')[0].textContent;
				//... only default scale for now
			},
			async: false
		});
	}
	
}

/**
 * This classe defines a buffer in which obsels can be put, and that will be displayed by a Player.
 * It is made to be used a connex interval, and has appropriate methodes to deal with it, and
 * basic operations are defined to transfert obsels between them.
 * @param baseURI
 * @returns {ObselIntervalBuffer}
 */
function ObselIntervalBuffer(baseURI, idPrefix)
{
	this.idPrefix = idPrefix + "-";
	this.baseURI = baseURI;
	this.svgDoc = null;
	this.svgElem = null;
	this.begin = null;
	this.end = null;
	
	this.init = function()
	{
		this.loadBaseG();
	}
	
	/**
	 * Loads the base SVG document necessary to 
	 */
	this.loadBaseG = function()
	{
		this.baseG = null;
		$.ajax({
			url: this.baseURI + '/svg/baseG.svg',
			context: this,
			success: function(data){
				this.svgDoc = data;
				//this.svgElem = this.svgDoc.getElementsByTagName('g')[0];
				this.svgElem = this.svgDoc.documentElement;
			},
			async: false
		});
	}
	
	/**
	 * Transfers the nodes in the given interval, from the given buffer into this buffer.
	 * @param buffer : the buffer to steal from
	 * @param from : a string stating wether we steal from the beginning or the end of the current buffer (this). 
	 * Must be 'before' or 'after'.
	 * @param here : the date at which begin to steal, if the current buffer (this) is empty.
	 * 
	 * /!\ NOT TESTED
	 */
	this.stealFrom = function(buffer, from, here)
	{
		if(here != undefined)
		{
			if(this.begin === this.end)
				this.begin = this.end = here;
			else
				throw TOTOException;
		}
		
		if(from == "before")
		{
			beginT = this.end;
			endT = null; // +oo
		}else if(from == "after")
		{
			endT = this.begin;
			beginT = null; // -oo
		}else 
			throw TOTOException;
		
		/* 
		 * We have to treat differently the elments on the frontier, 
		 * since they may already be in the current buffer, 
		 * and they have to be cloned and not removed from the stolen buffer.
		 */ 
		newObsels = buffer.svgElem.children().filter(
			parametrizeCallback(function (index, whatsthat, that, begin, end)
					{
						if(begin === null)
							return this.getAttribute('date')*1.0 == end && !that.hasObsel(this.getAttribute('id'));
						else if(end === null)
							return this.getAttribute('date')*1.0 == begin && !that.hasObsel(this.getAttribute('id'));
					}, {args: [this, beginT, endT]}
				)
			).clone();
		
		/*
		 * We then simply take the other stolen elements.
		 */
		newObsels.add(buffer.svgElem.children().filter(
			parametrizeCallback(function (index, whatsthat, that, begin, end)
				{
					if(begin === null)
						return this.getAttribute('date')*1.0 < end;
					else if(end === null)
						return this.getAttribute('date')*1.0 > begin;
				}, {args: [this, beginT, endT]}
			)
		));
		
		newObsels.appendTo(this.svgElem);
		
		if(this.onNewObsels)
			this.onNewObsels(newObsels, this);
		
		if(from == "before")
		{
			oldEnd = this.end;
			this.end = Math.max(this.end, buffer.end);
			buffer.shrinkIntervalFromEnd(oldEnd);
		}else if(from == "after")
		{
			oldBegin = this.begin;
			this.begin = Math.max(this.begin, buffer.end);
			buffer.shrinkIntervalFromBegin(oldBegin);
		}
	}
	
	/**
	 * Crops the obsels outside the given interval, and reduce interval boundaries if needed.
	 */
	this.cropObsels = function(beginDate, endDate)
	{
		if(endDate === undefined)
			endDate = null;
		
		$(this.svgElem).children().filter(
				parametrizeCallback(function(index, whatsthat, begin, end){
					if(begin === null)
						return this.getAttribute('date')*1.0 > end;
					else if(end === null)
						return this.getAttribute('date')*1.0 < begin;
					else
						return this.getAttribute('date')*1.0 < begin || this.getAttribute('date')*1.0 > end;
				},
				{args: [beginDate, endDate]})
		).remove();
		
		if(this.begin)
			this.begin = Math.max(this.begin, beginDate);
		if(this.end)
			this.end = Math.min(this.end, endDate);
	}
	
	/**
	 * Add a svg obsel element at the root of the element from a string.
	 */
	this.addObsels = function(svgString)
	{
		this.addObselsXML($.xmlDOM(svgString)[0].documentElement);
	}
	
	/**
	 * Add a svg obsel element at the root of the element from an XML doc.
	 * Checks wether each node is already in the doc, based on their ids.
	 */
	this.addObselsXML = function(xmlDOM)
	{
		var fragment = parseSVGNodeIntoFragment(xmlDOM, this.svgElem.ownerDocument);
		
		var newObsels = $(fragment).children();
		var toRem = newObsels.filter(
			parametrizeCallback(function(index, whatsthat, that){
				return that.hasObsel(that.idPrefix + this.getAttribute('id'));
			},
			{args: [this]})
		);
		newObsels = newObsels.not(toRem);
		toRem.remove();
		
		this.newBegin = this.begin;
		this.newEnd = this.end;
		
		if(newObsels.length > 0) this.maxId = newObsels.first()[0].getAttribute('id') + 0;
		newObsels.each(
				parametrizeCallback(function(index, whatsthat, that){
					var date = this.getAttribute('date');
					if(date > that.end)
						that.newEnd = Math.max(that.newEnd, date);
					
					if(date < that.begin)
						that.newBegin = Math.min(that.newBegin, date);
					
					that.maxId = Math.max(that.maxId, this.getAttribute('id'));

					this.setAttribute('obsel-id', this.getAttribute('id'));
					this.setAttribute('id', that.idPrefix + this.getAttribute('id'));
			},
			{args: [this]})
		);
		this.growInterval(this.newBegin, this.newEnd);
		
		this.svgElem.appendChild(fragment);
		
		if(this.onNewObsels)
			this.onNewObsels(newObsels, this, this.maxId);
	}
	
	/**
	 * Tells the buffer that a new data interval has been added to its interval.
	 * It *should* be connex with the current buffer interval if the buffer has and defined interval. 
	 */
	this.growInterval = function(beginAdded, endAdded)
	{
		if(this.begin === null)
			this.begin = beginAdded;
		else
			this.begin = Math.min(this.begin, beginAdded);
		
		if(this.end === null)
			this.end= endAdded;
		else
			this.end= Math.max(this.end, endAdded);
	}
	
	/**
	 * Tells the buffer that its interval has been cropped from the beginning.
	 */
	this.shrinkIntervalFromBegin = function(newBegin)
	{
		this.begin = Math.max(this.begin, newBegin);
		
		this.checkInterval();
	}

	/**
	 * Tells the buffer that its interval has been cropped from the end.
	 */
	this.shrinkIntervalFromEnd = function(newEnd)
	{
		this.end = Math.min(this.end, newEnd);
		
		this.checkInterval();
	}
	
	/**
	 * Checks wether the interval is incoherent or void, and puts everything back in place.
	 * @private
	 */
	this.checkInterval = function()
	{
		if(this.begin >= this.end)
		{
			this.cleanObsels();
			this.begin = null;
			this.end = null;
		}
	}
	
	/**
	 * Returns wether there is an obsel with this id in the document.
	 */
	this.hasObsel = function(obselId)
	{
		return this.svgElem.ownerDocument.getElementById(obselId) !== null;
	}
	
	/**
	 * Remove every obsel in interval.
	 * @private
	 */
	this.cleanObsels = function()
	{
		this.svgElem.empty();
	}
	
	/**
	 * Adopts the given node into internal svg doc, removing the node from where it were.
	 */
	this.giveSVGNodeBack = function(svgNode)
	{
		this.svgDoc.appendChild(svgNode);
	}

	/**
	 * Returns the svgg node element managed by the buffer.
	 */
	this.getSVGNode = function()
	{
		return this.svgElem;
	}
	
	/**
	 * Returns the svg document managed by the buffer.
	 */
	this.getSVGDoc = function()
	{
		return this.svgDoc;
	}
	
	this.onNewObsels = null;
}
