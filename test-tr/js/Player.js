function Player(playerDivElement, baseURI)
{
	this.playerRoot = playerDivElement;
	this.baseURI = baseURI;
	this.lastKnownId = null;
	this.lastKnownDate = null;
	
	/**
	 * Changes the scale at which the trace is viewed.
	 */
	this.setScale = function(scale)
	{
		this.scale = scale*1.0;
		this.rescaleObsels();
	}

	/**
	 * Changes the center of the trace viewed.
	 */
	this.setCenter = function(timeCode, pxOffset)
	{
		if(pxOffset == undefined)
			pxOffset = 0;
		
		// Initialize requestedBegin and requestedEnd if not done yet
		if(this.requestedBegin == undefined || this.requestedEnd == undefined)
		{
			this.requestedBegin = timeCode;
			this.requestedEnd = timeCode;
		}
		
		if(this.center != timeCode)
		{
			this.center = timeCode - pxOffset*1.0/this.scale;
			this.pxOffset = pxOffset;
			this.recenterObsels();
		}
	}
	
	/**
	 * Changes the center of the trace viewed.
	 */
	this.setAutoCenter = function(autoCenter)
	{
		this.autoCenter = autoCenter;
	}

	/**
	 * Centers the view center on the given center, wrt scale.
	 * @private
	 */
	this.recenterObsels = function()
	{
		if(this.graphDiv && this.center != undefined && this.scale != undefined)
		{
			this.displayer.scrollCenterTo(this.center*1.0*this.scale)
			this.centerText.textContent = (this.center*1.0).toFixed(2) + "";
		}
	}

	/**
	 * Rescale the nodes in width, according to the current scale.
	 * @private
	 */
	this.rescaleObsels = function()
	{
		this.displayer.suspendRedraw();
		$(this.bufferInterval.getSVGNode()).children().each( 
			parametrizeCallback(
					function(e, f, that) {
						//TODO OOOOOOOOOOOOOOOOOOo
						//TODO OOOOOOOOOOOOOOOOOOo
						//TODO OOOOOOOOOOOOOOOOOOo
						//TODO OOOOOOOOOOOOOOOOOOo
						//TODO OOOOOOOOOOOOOOOOOOo
						clearSVGNodeTRansformations(this);
						//reTranslateSVGNode(node, date*this.scale, 0); //TODO : with a matrix transformation...
						that.applyScale(this);
					},
				{args: [this]})
		);
		
		this.checkMissingData();
		
		this.adaptViewBox();
		this.recenterObsels();

		this.displayer.unsuspendRedraw();
	}
	
	/**
	 * Rescale one node in width, according to the current scale.
	 * @private
	 */
	this.applyScale = function(node)
	{
		date = node.getAttribute('date')*1.0;
		if(node.hasAttribute('begin') && node.hasAttribute('end'))
		{
			translateSVGNode(node, (date*1.0-0.5)*this.scale, 0);
			length = node.getAttribute('end') - node.getAttribute('begin') + 1.0;
			scaleSVGNode(node, this.scale*1.0*length, 1);
		}else{
			translateSVGNode(node, (date*1.0)*this.scale, 0);
		}
		//It's in here for optim purpose... 
		if(this.lastKnownDate === null)
			this.lastKnownDate = date;
		else
			this.lastKnownDate = Math.max(this.lastKnownDate, date);
	}
	
	this.adaptViewBox = function()
	{
		var viewWidth = 1000.0;
		
		// For now, we will use these, but it isn't really perfect...
		// No use being pixel-accurate, since we add some margin for over-scrolls
		var begin = this.requestedBegin;
		var end = this.requestedEnd;
		
		if(this.requestedBegin == undefined || this.requestedBegin > this.bufferInterval.begin)
			begin = this.bufferInterval.begin;
		
		if(this.requestedEnd == undefined || this.requestedEnd < this.bufferInterval.end)
			end = this.bufferInterval.end;

		begin *= this.scale;
		end *= this.scale;
		
		this.displayer.setXmin(begin - viewWidth);
		this.displayer.setXmax(end + viewWidth);
	}
	
	/**
	 * Sets the user element to display in the view rect, and display it if the base doc is loaded.
	 * @param svgElement an SVGElement.
	 */
	this.setDisplayedBuffer = function(bufferInterval)
	{
		if(this.bufferInterval != undefined)
		{
			this.bufferInterval.onNewObsels = null;
			this.bufferInterval.giveSVGNodeBack(this.bufferInterval);//TODO: d'oh !
		}
		
		this.bufferInterval = bufferInterval;
		this.bufferInterval.onNewObsels = parametrizeCallback(this.newObselsCallback, {scope: this});
		
		if(this.displayer != undefined)
		{
			this.insertDisplayedBuffer();
			this.recenterObsels();
			this.rescaleObsels();
		}
	}
	
	/**
	 * Called when new obsels are added to the displayed buffer.
	 */
	this.newObselsCallback = function(newObsels, buffer, maxId)
	{
		this.displayer.suspendRedraw();
		
		if(this.bufferInterval === buffer)
		{
			if(this.displayer != undefined)
			{
				this.lastLastKnownDate = this.lastKnownDate; 
				newObsels.each(
						parametrizeCallback( function(e, f, that) {
							that.applyScale(this);
							this.setAttribute('title', 'obsel');
						}, {args: [this]}
						)
				);
				
				if(this.autoCenter && this.lastLastKnownDate < this.lastKnownDate)
					this.setCenter(this.lastKnownDate, 490);

				this.lastKnownId = Math.max(this.lastKnownId, maxId);
			}

			this.adaptViewBox();
			this.recenterObsels();
		}else{
			buffer.onNewObsels = null;
		}
		
		this.displayer.unsuspendRedraw();
	}
	
	this.getLastKnownId = function()
	{
		return this.lastKnownId;
	}

	this.getLastKnownDate = function()
	{
		return this.lastKnownDate;
	}
	
	this.setWidth = function(width)
	{
		this.viewWidth = width;
		
		if(this.displayer != undefined)
			this.displayer.setWidth(width-2);
		
		if(this.graphDiv != undefined)
		{
			this.graphDiv.style.height = (width-2) + "px";
		}
		
		if(this.uiDiv != undefined)
		{
			this.adjustUIWidth();
		}
	}
	
	this.adjustUIWidth = function()
	{
		clearSVGNodeTRansformations(this.buttonsGroup);
		translateSVGNode(this.buttonsGroup, 0, this.viewWidth);
		
		this.frameRect.height.baseVal.value = this.viewWidth;
		this.uiDiv.getElementsByTagName('svg')[0].viewBox.baseVal.height = this.viewWidth*1 + 70;
		this.uiDiv.getElementsByTagName('svg')[0].viewBox.baseVal.width = 1000;
		this.uiDiv.getElementsByTagName('svg')[0].height.baseVal.value = this.viewWidth*1 + 70;
	}
	
	/**
	 * Initiate the base SVG document loading. Synchroneous. 
	 */
	this.load = function()
	{
		$.ajax({
			url: this.baseURI + "/html/basepl.xhtml",
			context: this,
			success: function(data){
				this.playerRoot.appendChild(data.documentElement);
				this.setupUI();
			},
			async: false
		});
	}
	
	/**
	 * Sets up the UI fonctionnalities. Called when the main svg is loaded.
	 */
	this.setupUI = function()
	{
		// Fetch some elements of the base document.
		this.graphDiv = getElementsByTitle(this.playerRoot, 'graph-div', true)[0];
		this.uiDiv = getElementsByTitle(this.playerRoot, 'ui-div', true)[0];
		this.infosDiv = getElementsByTitle(this.playerRoot, 'obsel-infos', true)[0];
		this.buttonsGroup = getElementsByTitle(this.uiDiv, 'buttons-group', true)[0];
		this.playButton = getElementsByTitle(this.playerRoot, 'play-button', true)[0];
		this.pauseButton = getElementsByTitle(this.playerRoot, 'pause-button', true)[0];
		this.minusButton = getElementsByTitle(this.playerRoot, 'minus-button', true)[0];
		this.plusButton = getElementsByTitle(this.playerRoot, 'plus-button', true)[0];
		this.printButton = getElementsByTitle(this.playerRoot, 'print-button', true)[0];
		this.frameRect = getElementsByTitle(this.playerRoot, 'trace-frame-rect', true)[0];
		this.centerText = getElementsByTitle(this.playerRoot, 'center-text', true)[0];
		this.fullbody = window;
		
		this.displayer = new Displayer(this.graphDiv, 500);
		
		// Moves the displayed element container to the view center.
		this.recenterObsels();

		// Registers the click callback for clicking on the play button.
		$(this.playButton).click(parametrizeCallback(this.onClickPlayPrivate, {scope: this}), false);
		
		// Registers the click callback for clicking on the play button.
		$(this.pauseButton).click(parametrizeCallback(this.onClickPausePrivate, {scope: this}), false);

		// Registers the click callback for clicking on the minus button.
		$(this.minusButton).click(parametrizeCallback(this.onClickMinusPrivate, {scope: this}), false);

		// Registers the click callback for clicking on the plus button.
		$(this.plusButton).click(parametrizeCallback(this.onClickPlusPrivate, {scope: this}), false);
		
		// Registers the click callback for clicking on the pint button.
		$(this.printButton).click(parametrizeCallback(this.onClickPrintPrivate, {scope: this}), false);
		
		// Registers the mousedown callback for dragging on the rect.
		$(this.frameRect).bind('mousedown', parametrizeCallback(this.onMouseDownRect, {scope: this}), false);
		$(this.graphDiv).bind('mousedown', parametrizeCallback(this.onMouseDownRect, {scope: this}), false);
		
		//Register mouse click on the graph zone to handle obsel clicks.
		$(this.graphDiv).bind('click', parametrizeCallback(this.onClickRectPrivate, {scope: this}), false);
		
		// Constructs the callbacks that will be attached to mousemove and mouseup events when dragging.
		this.onMouseMoveRectParam = parametrizeCallback(this.onMouseMoveRect, {scope: this});
		this.onMouseUpRectParam = parametrizeCallback(this.onMouseUpRect, {scope: this});
		
		// Displays the user element if already there.
		if(this.bufferInterval != undefined)
		{
			this.insertDisplayedBuffer();
		}
	}

	/**
	 * Triggered when play is clicked. Calls the user given onClickPlay callback (this.onClickPlay).
	 * @private
	 */
	this.onClickPlayPrivate = function()
	{
		if(this.onClickPlay)
			this.onClickPlay();
	}

	/**
	 * Triggered when pause is clicked. Calls the user given onClickPlay callback (this.onClickPause).
	 * @private
	 */
	this.onClickPausePrivate = function()
	{
		if(this.onClickPause)
			this.onClickPause();
	}
	
	/**
	 * Triggered when minus is clicked. Calls the user given onClickMinus callback (this.onClickMinus).
	 * @private
	 */
	this.onClickMinusPrivate = function()
	{
		if(this.onClickMinus)
			this.onClickMinus();
	}

	/**
	 * Triggered when plus is clicked. Calls the user given onClickPlus callback (this.onClickPlus).
	 * @private
	 */
	this.onClickPlusPrivate = function()
	{
		if(this.onClickPlus)
			this.onClickPlus();
	}
	
	/**
	 * Triggered when print is clicked. Calls the user given onClickPrint callback (this.onClickPrint).
	 * @private
	 */
	this.onClickPrintPrivate = function()
	{
		if(this.onClickPrint)
			this.onClickPrint();
	}

	/**
	 * Triggered when rect is clicked. Delegates the obsel clicks if necessary.
	 * @private
	 */
	this.onClickRectPrivate = function(e) {
		// If a callback is set to handle obsel clicks
		if (this.onObselClicked) {
			
			// The clicked element might not always be the g obsel node itself, but one of its children,
			// so we have to iterate thru its parents until we find the obsel node or reach to graph 
			// div (meaning the target doesn't belong to and obsel node).
			var node = e.target;
			while(node != this.graphDiv 
					&& !(node.hasAttribute('title') && node.getAttribute('title') == "obsel"))
			{
				node = node.parentNode;
			}
			
			if (node != this.graphDiv)
			{
				this.onObselClicked(e, node);
			}
		}
	}
	
	/**
	 * Actually inserts the displayed element into the hierarchy.
	 * @private
	 */
	this.insertDisplayedBuffer = function()
	{
		this.displayer.setSVGElement(this.bufferInterval.getSVGNode());
	}
	
	/**
	 * Callback triggered while pressing button on the view rectangle, to initiate the drag.
	 * @private
	 */
	this.onMouseDownRect = function(e)
	{
		e.preventDefault();
		
		this.dragging = true;
		this.xInit = e.clientX;
		this.yInit = e.clientY;
		this.centerInit = this.center;
		this.draggedCenter = this.center;
		
		$(this.fullbody).bind('mousemove', this.onMouseMoveRectParam, false);
		$(this.fullbody).bind('mouseup', this.onMouseUpRectParam, false);
		this.moveCenterTask = setTimeout(
				parametrizeCallback(this.updateDraggedCenter, {scope: this}),
				40);
	}
	
	/**
	 * A task running periodically when dragging, that updates the center.
	 * @private
	 */
	this.updateDraggedCenter = function()
	{
		if(this.center != this.draggedCenter)
		{
			this.setCenter(this.draggedCenter);
		}
		
		this.moveCenterTask = setTimeout(
			parametrizeCallback(this.updateDraggedCenter, {scope: this}),
			40);
	}
	
	/**
	 * Callback triggered while moving mouse, when dragging on the view rect.
	 * @private
	 */
	this.onMouseMoveRect = function(e)
	{
		if(this.dragging)
		{
			newX = e.clientX;
			newY = e.clientY;
			// Too slow !
			//this.setCenter(this.centerInit - (newX - this.xInit)/this.scale);
			// A periodic task will do the setCenter at a reasonnable pace.
			this.draggedCenter = this.centerInit - (newX - this.xInit)/this.scale;
		}else{
			// Shouldn't happen ! ... but just in case ...
			$(this.fullbody).unbind('mousemove', this.onMouseMoveRectParam);
			$(this.fullbody).unbind('mouseup', this.onMouseUpRectParam);
			clearTimeout(this.moveCenterTask);
		}
	}

	/**
	 * Callback triggered while releasing mouse button, when dragging on the view rect.
	 * @private
	 */
	this.onMouseUpRect = function(e)
	{
		this.dragging = false;
		this.xInit = undefined;
		this.yInit = undefined;
		
		$(this.fullbody).unbind('mousemove', this.onMouseMoveRectParam);
		$(this.fullbody).unbind('mouseup', this.onMouseUpRectParam);
		clearTimeout(this.moveCenterTask);
		
		this.checkMissingData();
	}
	
	/**
	 * Check wether we need more data because of the view moving out of the buffer interval,
	 * and request missing data if needed.
	 */
	this.checkMissingData = function()
	{
		if(this.onMissingData)
		{
			var viewWidth = 1000.0 / (this.scale*1.0);
			var viewBegin = this.center*1.0 - 0.5*viewWidth;
			var viewEnd = this.center*1.0 + 0.5*viewWidth;
			
			/*
			 * this.requestedBegin and this.requestedEnd serve to avoid
			 * requesting many times the same data. It stores the total
			 * interval that should be in buffer after all requests come
			 * to term.
			 */
			if(this.requestedBegin == undefined || this.requestedBegin > this.bufferInterval.begin)
				this.requestedBegin = this.bufferInterval.begin;
			
			if(this.requestedEnd == undefined || this.requestedEnd < this.bufferInterval.end)
				this.requestedEnd = this.bufferInterval.end;
			
			/* Require a little more data than necessary (1 viewWidth long), 
			 * to prevent future needs. */
			if(viewBegin < this.requestedBegin)
			{
				this.onMissingData(viewBegin - viewWidth, this.requestedBegin);
				this.requestedBegin = viewBegin - viewWidth;
			}
			
			if(viewEnd > this.requestedEnd)
			{
				this.onMissingData(this.requestedEnd, viewEnd + viewWidth)
				this.requestedEnd = viewEnd + viewWidth;
			}
		}
	}
	
	this.exportView = function()
	{
		return this.displayer.exportView();
	}
	
	this.onClickPlay = null;
	this.onClickPause = null;
	this.onClickMinus = null;
	this.onClickPlus = null;
	this.onClickPrint = null;
	this.onMissingData = null;
}

function Displayer(divElement, centerOffset)
{
	this.zeroOffset = 0;
	this.centerOffset = centerOffset;
	this.svgElement = null;
	this.divElement = divElement;
	this.suspendedRedraw = null;
	this.width = null;
	this.xcenter = null;
	
	this.setSVGElement = function(svgElement)
	{
		this.svgElement = svgElement;
		this.divElement.appendChild(svgElement);
		
		if(this.width !== null)
		{
			this.setWidth(this.width);
		}
	}
	
	this.setWidth = function(width)
	{
		this.width = width;
		if(this.svgElement !== null)
		{
			this.svgElement.height.baseVal.value = width;
			this.svgElement.viewBox.baseVal.height = width;
			this.svgElement.viewBox.baseVal.y = - width/2;
		}
	}
	
	this.setXmin = function(xmin)
	{
		this.zeroOffset =  - xmin;
		if(this.svgElement !== null)
		{
			this.svgElement.viewBox.baseVal.x = xmin;
			this.svgElement.width.baseVal.value = this.svgElement.viewBox.baseVal.width;
		}
	}
	
	this.setXmax = function(xmax)
	{
		if(this.svgElement !== null)
		{
			this.svgElement.viewBox.baseVal.width = xmax + this.zeroOffset;
			this.svgElement.width.baseVal.value = this.svgElement.viewBox.baseVal.width;
		}
	}
	
	this.scrollCenterTo = function(xcenter)
	{
		this.xcenter = xcenter;
		this.divElement.scrollLeft = xcenter + this.zeroOffset - this.centerOffset;
	}

	this.suspendRedraw = function()
	{
		if(this.suspendedRedraw === null && this.svgElement !== null)
		{
			// suspendRedraw seems buggy with firefox < 4.0
			if($.browser['mozilla'] && $.browser['version'].substr(0, 3)*1.0 >= 2.0)
			{
				this.suspendedRedraw = this.svgElement.suspendRedraw(200);
			}
		}
	}
	
	this.unsuspendRedraw = function()
	{
		if(this.suspendedRedraw !== null && this.svgElement !== null)
		{
			// suspendRedraw seems buggy with firefox < 4.0
			if($.browser['mozilla'] && $.browser['version'].substr(0, 3)*1.0 >= 2.0)
			{
				/*this.svgElement.unsuspendRedraw(this.suspendedRedraw);
				this.svgElement.unsuspendRedrawAll();*/
				this.suspendedRedraw = null;
			}
		}
	}
	
	this.exportView = function()
	{
		newSVG = this.svgElement.cloneNode(true);
		newSVG.viewBox.baseVal.x = this.xcenter - this.centerOffset;
		newSVG.viewBox.baseVal.width = 1000.0; 
		newSVG.width.baseVal.value = 1000.0;
		
		return newSVG
	}
}
