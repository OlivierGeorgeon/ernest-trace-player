function Displayer(svgTrace, defaultWidth, xWWidth, defaultScale, defaultCenter, divElement, centerOffset)
{
	this.scale = defaultScale;
	this.dateCenter = parseFloat(defaultCenter);
	this.xcenter = null;
	this.width = parseFloat(defaultWidth); // Display window height
	this.xWWidth = parseFloat(xWWidth); // Disaply window width (1000.0)
	this.svgTrace = svgTrace;
	this.divElement = divElement;
	this.centerOffset = parseFloat(centerOffset);
	this.autoCenter = false;
	this.svgElement = null;
	this.suspendedRedraw = null;
	this.dateCenter = 0.0;
	this.zeroOffset = 0.0;
	
	this.init = function()
	{
		this.svgElement = svgTrace.getSVGNode();
		this.svgElement = this.divElement.ownerDocument.importNode(this.svgElement, true);
		
		this.divElement.appendChild(this.svgElement);

		//Add some margin to allow scrolling over the edge
		this.svgElement.style.marginLeft = '1000px';
		this.svgElement.style.marginRight = '1000px';
		
		svgTrace.setSVGNode(this.svgElement);
		
		this.setWidth(this.width);
		
		this.xcenter = this.dateCenter * this.scale;
		
		this.setViewPort(this.xcenter-this.xWWidth, this.xcenter+2.0*this.xWWidth);
		
		this.rescrollCenter();

		this.svgTrace.elementsAdded = parametrizeCallback(
				this.onNewElements,
				{scope: this}
		);
		
		this.svgTrace.ModifiedElement = parametrizeCallback(
				this.onModifiedElement,
				{scope: this}
		);
		
		this.scaleJQCallback = parametrizeCallback(
			function (index, whatsthat, that)
			{
				that.scaleObsel(this);
			},
			{args: [this]}
		);

		this.svgTrace.willModifyCB = parametrizeCallback(
				this.suspendRedraw,
				{scope: this}
		);
		
		this.svgTrace.commitModificationsCB = parametrizeCallback(
				this.unsuspendRedraw,
				{scope: this}
		);
	}
	
	//Private
	this.onNewElements = function(elements)
	{
		elements.each(this.scaleJQCallback);
		this.planAdjustViewPort();
	}
	
	//Private
	this.onModifiedElement = function(element)
	{
		this.scaleObsel(element);
		this.planAdjustViewPort();
	}
	
	/**
	 * Sets the scale at which display the obsels.
	 */
	this.setScale = function(scale)
	{
		this.scale = parseFloat(scale);
		this.rescaleObsels();
		this.planAdjustViewPort();
		this.rescrollCenter();
	}
	
	/**
	 * Returns the scale at which the obsels are currently displayed.
	 */
	this.getScale = function()
	{
		return this.scale;
	}
	
	//Private
	this.scaleObsel = function(node)
	{
		var date = parseFloat(node.getAttribute('date'));
		if(isNaN(date))
			date = 0.0;
		
		if(node.hasAttribute('begin') && node.hasAttribute('end'))
		{
			translateSVGNode(node, (date-0.5)*this.scale, 0);
			length = parseFloat(node.getAttribute('end')) - parseFloat(node.getAttribute('begin')) + 1.0;
			if(isNaN(length))
				length = 1.0;
			
			scaleSVGNode(node, this.scale*length, 1);
		}else{
			translateSVGNode(node, date*this.scale, 0);
		}
	}
	
	//Private
	this.rescaleObsel = function(node)
	{
		var date = parseFloat(node.getAttribute('date'));
		if(isNaN(date))
			date = 0.0;
		
		if(node.hasAttribute('begin') && node.hasAttribute('end'))
		{
			//TODO: do that better
			clearSVGNodeTRansformations(node);
			translateSVGNode(node, (date-0.5)*this.scale, 0);
			
			var length = parseFloat(node.getAttribute('end')) - parseFloat(node.getAttribute('begin')) + 1.0;
			if(isNaN(length))
				length = 1.0;
			scaleSVGNode(node, this.scale*length, 1);
		}else{
			reTranslateSVGNode(node, date*this.scale, 0);
		}
	}
	
	/**
	 * Rescale the nodes in width, according to the current scale.
	 * @private
	 */
	this.rescaleObsels = function()
	{
		//this.suspendRedraw();
		$(this.svgElement).children().each( 
			parametrizeCallback(
				function(e, f, that) {
					that.rescaleObsel(this);
				},
			{args: [this]})
		);

		//this.unsuspendRedraw();
	}
	
	/**
	 * Enables or disables the auto scrolling to the new obsels (or modified ones).
	 */
	this.setAutoCenter = function(auto)
	{
		this.autoCenter = auto;
	}

	this.clockTick = function(clock)
	{
		this.dateCenter  = parseFloat(clock);
		this.recenterAuto();
	}
	
	//Private
	this.recenterAuto = function()
	{
		if(this.autoCenter)
		{
			this.rescrollCenter();
		}
	}

	/**
	 * Set the center of the view to the given date.
	 */
	this.scrollCenterTo = function(center)
	{
		this.dateCenter = parseFloat(center);
		this.rescrollCenter();
	}
	
	//Private
	this.rescrollCenter = function()
	{
		this.xcenter = this.dateCenter*this.scale + this.zeroOffset;

		this.checkAdjustViewPort();
		
		this.divElement.scrollLeft = this.xcenter - this.centerOffset;
		
		if(this.onscrolled)
		{
			this.onscrolled();
		}
	}

	/**
	 * Gets the current view center's date.
	 */
	this.getCenter = function()
	{
		return this.dateCenter;
	}

	/**
	 * Plannify a viewport adjust. Will not do it until necessary, though.
	 * @private
	 */
	this.planAdjustViewPort = function()
	{
		this.ajust = true;
	}

	/**
	 * Do a viewport adjust if necessary.
	 */
	this.checkAdjustViewPort = function()
	{
		if(this.ajust 
		   && (
				   this.dateCenter*this.scale - 0.5*this.xWWidth < this.vbX
		        || this.dateCenter*this.scale + 0.5*this.xWWidth > this.vbWidth + this.vbX
		   )
		)
		{
			this.ajust = false;
			this.adjustViewPort();
		}
	}
	
	//Private
	this.adjustViewPort = function()
	{
		var bbox = this.svgElement.getBBox();
		
		//if bbox is too close (100px ? 1 px ?) to the viewport, extend it 1 xWWidth away from it each side
		//same if too far (2000 ?)
		/*if(bbox.x + bbox.width + 100 > this.svgElement.viewBox.baseVal.x + this.svgElement.viewBox.baseVal.width
		|| bbox.x - 100 < this.svgElement.viewBox.baseVal.x
		|| bbox.x + bbox.width + 2000 < this.svgElement.viewBox.baseVal.x + this.svgElement.viewBox.baseVal.width
		|| bbox.x - 2000 > this.svgElement.viewBox.baseVal.x)
		{*/
			this.setViewPort(bbox.x-this.xWWidth, bbox.width + 2.0*this.xWWidth);
		/*}*/
	}
	
	//Private
	this.setViewPort = function(xMin, xWidth)
	{
		//var nxMin = Math.min(xMin, this.xcenter-2.5*this.xWWidth);
		//var nxWidth = Math.max(xWidth, (this.xcenter+2.5*this.xWWidth) - nxMin);
		
		/*var nxMin = this.xcenter-2.5*this.xWWidth;
		var nxWidth = 5*this.xWWidth;*/
		
		var nxMin = xMin;
		var nxWidth = xWidth;
		
		if(nxMin < this.dateCenter*this.scale - 2.0*this.xWWidth)
		{
			nxMin = this.dateCenter*this.scale - 2.0*this.xWWidth;
			this.adjust = true;
		}
		
		if(nxWidth > 4.0*this.xWWidth)
		{
			nxWidth = 4.0*this.xWWidth;
			this.adjust = true;
		}

		this.vbX = nxMin;
		this.vbWidth = nxWidth;
		this.zeroOffset = -nxMin;
		
		this.svgElement.width.baseVal.value = nxWidth;
		this.svgElement.viewBox.baseVal.x = nxMin;
		this.svgElement.viewBox.baseVal.width = nxWidth;
		this.svgElement.style.width = nxWidth;
		this.divElement.style.width = nxWidth;
	}

	//Private
	this.setWidth = function(width)
	{
		this.width = parseFloat(width);
		if(this.svgElement !== null)
		{
			this.svgElement.height.baseVal.value =  width;
			this.svgElement.viewBox.baseVal.height = width;
			this.svgElement.viewBox.baseVal.y = 1- width/2;
		}
		
		this.divElement.style.height = "" + width + "px";
	}
	
	/**
	 * Disables the redrawing of the svg document (for optim purpose).
	 */
	this.suspendRedraw = function()
	{
		if(this.suspendedRedraw === null && this.svgElement !== null)
		{
			// suspendRedraw seems buggy with firefox < 4.0
			if(($.browser['mozilla'] && parseFloat($.browser['version'].substr(0, 3)) >= 2.0)
			 || $.browser['webkit'])
			{
				this.suspendedRedraw = this.svgElement.suspendRedraw(100000);
			}
		}
	}

	/**
	 * Enables again the redrawing of the svg document (for optim purpose).
	 */
	this.unsuspendRedraw = function()
	{
		if(this.suspendedRedraw !== null && this.svgElement !== null)
		{
			// suspendRedraw seems buggy with firefox < 4.0
			if(($.browser['mozilla'] && parseFloat($.browser['version'].substr(0, 3)) >= 2.0)
			 || $.browser['webkit'])
			{
				this.svgElement.unsuspendRedraw(this.suspendedRedraw);
				this.suspendedRedraw = null;
			}
		}
	}
	
	/**
	 * Returns a copy of the svg tree, with viewport fitting the current view.
	 */
	this.exportView = function()
	{
		var newSVG = this.svgElement.cloneNode(true);
		newSVG.viewBox.baseVal.x = this.dateCenter*this.scale - .5 * this.xWWidth;//this.centerOffset;
		newSVG.viewBox.baseVal.width = this.xWWidth; 
		newSVG.width.baseVal.value = this.xWWidth;
		
		return newSVG
	}
	
	this.cleanup = function()
	{
		this.unsuspendRedraw();
		this.onscrolled = null;
		this.svgTrace = null;
		this.divElement = null;
		this.svgElement = null;
	}
	
	this.onscrolled = null;
	
	this.init();
}