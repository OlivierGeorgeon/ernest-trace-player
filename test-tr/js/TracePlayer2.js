function TracePlayer2(div_id, noticeDiv_id, pipeline,/* infoView,*/ traceHandler, traceRef, traceModel, baseURI)
{
	this.baseURI = baseURI;
	this.div_id = div_id;
	this.div = null;
	this.noticeDiv_id = noticeDiv_id;
	this.notice_div = null;
	this.pipeline = pipeline;
	this.traceHandler = traceHandler;
	this.traceRef = traceRef;
	this.traceModel = traceModel;
	this.svgTrace = null;
	this.xmlSerializer = new XMLSerializer();
	
	
	/**
	 * Loads the pipeline informations from the server (for now, these informations are 
	 * the default scale, default center and the graph width).
	 */
	this.getPipelineInfos = function()
	{
		$.ajax({
			url: this.baseURI + '/php/getPipelineInfos.php?pipelineId=' + this.pipeline,
			context: this,
			success: function(data){
				this.defaultScale = data.getElementsByTagName('default-scale')[0].textContent;
				this.defaultCenter = data.getElementsByTagName('default-center')[0].textContent;
				this.yWWidth = data.getElementsByTagName('graph-width')[0].textContent;
			},
			async: false
		});
	}
	
	/**
	 * Loads and display the player.
	 */
	this.start = function()
	{
		// Fetch the html div in which our player will be.
		this.div = $("#" + div_id)[0];
		this.notice_div = $("#" + noticeDiv_id)[0];
		
		// Fetch the informations about the pipeline's view.
		this.getPipelineInfos();
		
		// Initiate the stream controler.
		this.streamControler = new StreamControler(
			this,
			this.baseURI + '/php/rtfeed.php',
			{
				 "pipelineId": this.pipeline,
			     "traceHandler": this.traceHandler,
			     "traceRef": this.traceRef,
			     "traceModel": this.traceModel
			}
		);
		
		// Create the trace objet that will manage the svg graph document.
		this.svgTrace = new SVGTrace(this.baseURI, this.div_id);

		// Create the instruction executer.
		this.ainInterpreter = new AInInterpreter(this.svgTrace, {});
		
		// Initialize the Player UI
		this.player = new Player2(this.div, this.notice_div, this.baseURI, this.svgTrace, 
				this.yWWidth, 1000.0, this.defaultScale, this.defaultCenter);
		
		// Trigger the loading of the UI and element displaying
		this.player.load();
		this.player.setAutoCenter(false);
		
		/*
		 * Set the behaviors of the UI buttons.
		 */
		this.player.onClickPlay = parametrizeCallback(function()
				{
					this.streamControler.startStreaming({});
					this.player.setAutoCenter(true);
				}, {scope: this}
			);
		
		this.player.onClickPause = parametrizeCallback(function()
				{
					this.streamControler.stopStreaming();
				}, {scope: this}
			);
		
		this.player.onClickMinus = function()
		{
			this.setScale(this.getScale() * 1.0/1.5);
		};

		this.player.onClickPlus = function()
		{
			this.setScale(this.getScale() * 1.5);
		};
		
		this.player.onClickPrint = parametrizeCallback(function()
			{
				docToPrint = this.player.exportView();
				var win = window.open('html/void.xhtml', 'print-popup', 'width=1000px, height='+this.viewWidth+'px');
				win.onload = parametrizeCallback(function(e, win){
					win.document.body.appendChild(docToPrint);
				}, {scope: this, args: [win]});
			}, {scope: this}
		);	

		this.player.onObselClicked = parametrizeCallback(
			function(e, clickedNode)
			{
				var data = this.svgTrace.getHTMLTooltip(clickedNode.getAttribute('obsel-id'));
				$(this.player.infosDiv).empty();
				this.player.infosDiv.appendChild(data);
			}, {scope: this}
		);
	}
	
	this.processMessage = function(element)
	{
		try{
			var message = $.xmlDOM(element);
			var topnode = message.children()[0];
			
			if(topnode == undefined)
			{
				this.notifyUser("Empty message: " + element + ".");
			}else if(topnode.nodeName == 'eot')
			{
				this.streamControler.stopStreaming();
			}else if(topnode.nodeName == 'error')
			{
				this.errorString = topnode.textContent;
				/*$(topnode).contents().each(
						parametrizeCallback(function(index, elem, that)
							{
								if(this.nodeType != 3)
								{
									that.errorString += that.xmlSerializer.serializeToString(this)
								}else{
									that.errorString += this.nodeValue;
								}
							},
							{args: [this]}
						)
				);*/
				this.notifyUser(this.errorString);
				this.errorString = undefined;
			}else if(topnode.nodeName == 'deltas'){
				var clock = jQuery('deltas > delta[source="clock"]:last', message).text();
				var instructions = jQuery('deltas > delta[source!="clock"]', message).children();
				
				this.ainInterpreter.execute(instructions);
				if(clock != "")
				{
					this.player.clockTick(clock);
					this.streamControler.setStreamTime(clock);
				}
			}
		}catch (e) {
			alert("While streaming :" + e);
		}
	}

	this.notifyUser = function(html)
	{
		this.player.notifyUser(html + "<br />");
	}
	
	this.clearUserNotice = function()
	{
		this.player.clearNotices();
	}
	
}
