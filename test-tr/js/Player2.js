function Player2(playerDivElement, noticeDivElement, baseURI, svgTrace, defaultWidth, xWWidth, defaultScale, defaultCenter)
{
	this.playerRoot = playerDivElement;
	this.playerNotice = $(noticeDivElement);
	this.baseURI = baseURI;
	this.svgTrace = svgTrace;
	this.displayer = null;
	this.yWWidth = defaultWidth;
	this.xWWidth = xWWidth;
	this.scale = defaultScale;
	this.center = defaultCenter;
	this.eventmove = null;
	this.eventup = null;
	
	//Private
	this.adjustUIWidth = function()
	{
		clearSVGNodeTRansformations(this.buttonsGroup);
		translateSVGNode(this.buttonsGroup, 0, this.yWWidth*1+2);
		
		this.frameRect.height.baseVal.value = this.yWWidth*1+2;
		this.uiDiv.getElementsByTagName('svg')[0].viewBox.baseVal.height = this.yWWidth*1 + 72;
		this.uiDiv.getElementsByTagName('svg')[0].viewBox.baseVal.width = this.xWWidth;
		this.uiDiv.getElementsByTagName('svg')[0].height.baseVal.value = this.yWWidth*1 + 72;
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
		
		this.displayer = new Displayer(this.svgTrace, this.yWWidth, this.xWWidth, this.scale, this.senter, this.graphDiv, this.xWWidth/2-1000);
		
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
		//JQuery event management is too slow !
		//$(this.frameRect).bind('mousedown', parametrizeCallback(this.onMouseDownRect, {scope: this}), false);
		this.frameRect.onmousedown = parametrizeCallback(this.onMouseDownRect, {scope: this});
		//$(this.graphDiv).bind('mousedown', parametrizeCallback(this.onMouseDownRect, {scope: this}), false);
		this.graphDiv.onmousedown = parametrizeCallback(this.onMouseDownRect, {scope: this});
		
		// Register mouse click on the graph zone to handle obsel clicks.
		//$(this.graphDiv).bind('click', parametrizeCallback(this.onClickRectPrivate, {scope: this}), false);
		this.graphDiv.onclick = parametrizeCallback(this.onClickRectPrivate, {scope: this});
		
		// Constructs the callbacks that will be attached to mousemove and mouseup events when dragging.
		this.onMouseMoveRectParam = parametrizeCallback(this.onMouseMoveRect, {scope: this});
		this.onMouseUpRectParam = parametrizeCallback(this.onMouseUpRect, {scope: this});
		
		this.displayer.onscrolled = parametrizeCallback(this.updateCenterText, {scope: this});
		
		// Adjust button positions and svg size to the graph width.
		this.adjustUIWidth();
	}

	/**
	 * Triggered when the display is scrolled, with mouse or automatically.
	 * @private
	 */
	this.updateCenterText = function()
	{
		this.centerText.textContent = (this.displayer.getCenter()*1.0).toFixed(2) + "";
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
	 * Callback triggered while pressing button on the view rectangle, to initiate the drag.
	 * @private
	 */
	this.onMouseDownRect = function(e)
	{
		if(!this.dragging)
		{
			e.preventDefault();
			
			this.displayer.planAdjustViewPort();
			//this.displayer.checkAdjustViewPort();
			
			this.dragging = true;
			this.xInit = e.clientX;
			this.yInit = e.clientY;
			this.centerInit = this.displayer.getCenter();
			this.draggedCenter = this.displayer.getCenter();
	
			//JQuery event management is too slow !
			//$(this.fullbody).bind('mousemove', this.onMouseMoveRectParam, false);
			//$(this.fullbody).bind('mouseup', this.onMouseUpRectParam, false);
			
			//this.oldfullbodyonmousemove = this.fullbody.onmousemove;
			//this.oldfullbodyonmouseup = this.fullbody.onmouseup;
			
			/*this.fullbody.onmousemove = this.onMouseMoveRectParam;
			this.fullbody.onmouseup = this.onMouseUpRectParam;
			*/
			
			this.eventmove = this.fullbody.addEventListener("mousemove", this.onMouseMoveRectParam, true);
			this.eventup = this.fullbody.addEventListener("mouseup", this.onMouseUpRectParam, true);
			
			this.moveCenterTask = setTimeout(
					parametrizeCallback(this.updateDraggedCenter, {scope: this}),
					40);
		}
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
			var newX = e.clientX;
			var newY = e.clientY;
			// Too slow !
			//this.setCenter(this.centerInit - (newX - this.xInit)/this.scale);
			// A periodic task will do the setCenter at a reasonnable pace.
			this.draggedCenter = this.centerInit - (newX - this.xInit)/this.getScale();
		}else{
			// Shouldn't happen ! ... but just in case ...
			//$(this.fullbody).unbind('mousemove', this.onMouseMoveRectParam);
			//$(this.fullbody).unbind('mouseup', this.onMouseUpRectParam);

			/*this.fullbody.onmousemove = this.oldfullbodyonmousemove;
			this.fullbody.onmouseup = this.oldfullbodyonmouseup;*/
			if(this.eventmove !== null)
			{
				this.fullbody.removeEventListener('mousemove', this.eventmove, true);
				this.eventmove = null;
			}
			
			if(this.eventup !== null)
			{
				this.fullbody.removeEventListener('mouseup', this.up, true);
				this.eventup = null;
			}
			
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
		
		//$(this.fullbody).unbind('mousemove', this.onMouseMoveRectParam);
		//$(this.fullbody).unbind('mouseup', this.onMouseUpRectParam);
		
		//this.fullbody.onmousemove = this.oldfullbodyonmousemove;
		//this.fullbody.onmouseup = this.oldfullbodyonmouseup;
		if(this.eventmove !== null)
		{
			this.fullbody.removeEventListener('mousemove', this.eventmove, true);
			this.eventmove = null;
		}
		
		if(this.eventup !== null)
		{
			this.fullbody.removeEventListener('mouseup', this.up, true);
			this.eventup = null;
		}
		
		clearTimeout(this.moveCenterTask);
	}
	
	/**
	 * Returns a copy of the svg tree, with viewport fitting the current view.
	 */
	this.exportView = function()
	{
		return this.displayer.exportView();
	}

	/**
	 * Changes the scale at which the trace is viewed.
	 */
	this.setScale = function(scale)
	{
		this.displayer.setScale(scale*1.0);
	}
	
	/**
	 * Gets the scale at which the trace is viewed.
	 */
	this.getScale = function()
	{
		return this.displayer.getScale();
	}

	/**
	 * Changes the center of the view.
	 */
	this.setCenter = function(center)
	{
		this.displayer.scrollCenterTo(center);
	}
	
	/**
	 * Gets the view center.
	 */
	this.getCenter = function()
	{
		return this.displayer.getCenter();
	}
	
	this.setAutoCenter = function(auto)
	{
		this.displayer.setAutoCenter(auto);
	}
	
	/**
	 * Triggered whenever a clock message is received.
	 */
	this.clockTick = function(clockValue)
	{
		this.clock = clockValue;
		this.displayer.clockTick(clockValue);
	}

	/**
	 * Notices the user of a message.
	 */
	this.notifyUser = function(html)
	{
		this.playerNotice.prepend(html);
	}
	
	/**
	 * Clear the user notice div.
	 */
	this.clearNotices = function()
	{
		this.playerNotice.empty();
	}
	
	this.cleanup = function()
	{
		if(this.eventmove !== null)
		{
			this.fullbody.removeEventListener('mousemove', this.eventmove, true);
			this.eventmove = null;
		}
		
		if(this.eventup !== null)
		{
			this.fullbody.removeEventListener('mouseup', this.up, true);
			this.eventup = null;
		}
		
		clearTimeout(this.moveCenterTask);
		
		this.displayer.cleanup();
	}
	
	this.onClickPlay = null;
	this.onClickPause = null;
	this.onClickMinus = null;
	this.onClickPlus = null;
	this.onClickPrint = null;
}