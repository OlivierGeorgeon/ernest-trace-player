function SVGTrace(baseURI, idPrefix)
{
	this.idPrefix = idPrefix + "-";
	this.svgElem = null;
	this.tooltips = {};
	
	/**
	 * Loads the base SVG document.
	 */
	this.loadBaseDoc = function(baseURI)
	{
		$.ajax({
			url: baseURI + '/svg/baseG.svg',
			context: this,
			success: function(data){
				var svgDoc = data;
				this.svgElem = svgDoc.documentElement;
			},
			async: false
		});
	}
	

	/**
	 * Returns the svg document managed by the buffer.
	 */
	this.getSVGDoc = function()
	{
		return this.svgElem.ownerDocument;
	}
	
	/**
	 * Returns the svg node element managed by the buffer.
	 */
	this.getSVGNode = function()
	{
		return this.svgElem;
	}
	
	/**
	 * Retreive an obsel based on its id.
	 */
	this.getObsel = function(id)
	{
		elt = this.getSVGDoc().getElementById(this.idPrefix + id);
		
		return elt;
	}

	/**
	 * Returns a new empty fragment from the svg doc.
	 */
	this.createFragment = function()
	{
		return this.getSVGDoc().createDocumentFragment();
	}

	/**
	 * Parses a svg string into a svg dom fragment belonging to the document.
	 * It is *necessary* to use this method to parse it, the browser's XML parser
	 * won't make svg dom nodes (neither html ones alas unless one uses innerHTML). 
	 */
	this.parseSVGIntoFragment = function(svgString)
	{
		var xmlDOM = $.xmlDOM(svgString)[0].documentElement;
		return this.xmlToSVGNewFragment(xmlDOM);
	}

	/**
	 * Translates a xml tree into a svg dom tree (see parseSVGIntoFragment()).
	 */
	this.xmlToSVGNewFragment = function(xmlDOM)
	{
		var fragment = parseSVGNodeIntoFragment(xmlDOM, this.svgElem.ownerDocument);
		return fragment;
	}
	
	/**
	 * Translates a xml tree into a svg dom tree (see parseSVGIntoFragment()).
	 */
	this.xmlToSVGFragment = function(xmlDOM, fragment)
	{
		parseSVGElementIntoExistingFragment(xmlDOM, this.getSVGDoc(), fragment);
	}

	/**
	 * Deletes an obsel based on its id.
	 */
	this.deleteObsel = function(element)
	{
		var elt = element;
		if(typeof element == 'string')
		{
			elt = this.getObsel(element);
		}
		
		if(elt !== null)
		{
			if(this.removingElement)
			{
				this.removingElement(elt)
			}
			
			elt.parentNode.removeChild(elt);
		}
		
		if(this.elementsDeleted)
		{
			this.elementsDeleted();
		}
	}
	
	/**
	 * Deletes the JQuery collection of nodes (obsels !) given.
	 * One must uses this method to delete them in order to trigger
	 * the right hooks.
	 */
	this.deleteObsels = function(obselJQCol)
	{
		obselJQCol.each(
			parametrizeCallback(function(index, whatsthat, that){
				if(that.removingElement)
				{
					that.removingElement(this)
				}
				this.parentNode.removeChild(this);
			},
			{args: [this]})
		);
		
		if(this.elementsDeleted)
		{
			this.elementsDeleted();
		}
	}
	
	/**
	 * Adds the obsels contained in the fragment to the displayed trace.
	 * The fragment will be emptied of those elements.
	 */
	this.addObsels = function(svgFragment)
	{
		var newObsels = $(svgFragment).children();
		newObsels.each(
			parametrizeCallback(function(index, whatsthat, that){
				that.processNewObsel(this);
			},
			{args: [this]})
		);

		this.svgElem.appendChild(svgFragment);

		if(this.elementsAdded)
		{
			this.elementsAdded(newObsels);
		}
	}
	
	//Private
	this.processNewObsel = function(obselNode)
	{
		obselNode.setAttribute('id', this.idPrefix + obselNode.getAttribute('id'));
		obselNode.setAttribute('title', 'obsel');
		
		if(this.addingElement)
		{
			this.addingElement(obselNode);
		}
	}

	/**
	 * Adds an obsel to the displayed trace.
	 */
	this.addObsel = function(svgElement)
	{
		this.processNewObsel(svgElement);
		this.svgElem.appendChild(svgElement);
		
		if(this.elementsAdded)
		{
			this.elementsAdded($(svgElement));
		}
	}
	
	/**
	 * Replaces the obsel with the given id by the given obsel node.
	 */
	this.replaceObsel = function(svgElement, id)
	{
		var elt = this.getSVGDoc().getElementById(this.idPrefix + id);
		
		if(elt !== null)
		{
			elt.parentNode.removeChild(elt);
		}
		
		svgElement.setAttribute('id', this.idPrefix + id);
		svgElement.setAttribute('title', 'obsel');
		this.svgElem.appendChild(svgElement);
		
		if(this.modifiedElement)
		{
			this.modifiedElement(svgElement);
		}
	}
	
	/**
	 * Signals the given obsel has been modified.
	 * Must be called in particular if its size or date has changed (pretty useless if not).
	 */
	this.obselModified = function(element)
	{
		if(this.modifiedElement)
		{
			var elt = element;
			if(typeof element == 'string')
			{
				elt = this.getObsel(element);
			}
			
			this.modifiedElement(elt);
		}
	}
	
	/**
	 * Checks whether an obsel with the given id exists in the trace.
	 */
	this.hasObsel = function(id)
	{
		return this.getSVGDoc().getElementById(this.idPrefix + id) !== null;
	}

	/**
	 * Sets the tooltip to be displayed when clicked on an obsel.
	 * @param nodes: a JQuery collection of xml nodes (that will be translated into html elements).
	 * @param obsel_id: the obsel id for which display that tooltip.
	 */
	this.setToolTip = function(nodes, obsel_id)
	{
		this.tooltips[obsel_id] = nodes;
	}
	
	/**
	 * Gets the tooltip associated with a given obsel id, in the form of an html document fragment.
	 */
	this.getHTMLTooltip = function(obsel_id)
	{
		var fragment = document.createDocumentFragment();
		this.tooltips[obsel_id].each(parametrizeCallback(function(index, Element, fragment)
			{
				xmlToExistingHTMLFragment(this, fragment);
			},
			{args: [fragment]}
		));
		return fragment;
	}
	
	this.willModify = function()
	{
		if(this.willModifyCB)
		{
			this.willModifyCB();
		}
	}
	
	this.commitModifications = function()
	{
		if(this.commitModificationsCB)
		{
			this.commitModificationsCB();
		}
	}
	
	this.elementsAdded = null; //params : JQuery collection
	this.addingElement = null; //params : SVGElement
	this.removingElement = null; //params : SVGElement
	this.modifiedElement = null; //params : SVGElement
	this.elementsDeleted = null; //params : none
	this.willModifyCB = null; //params : none
	this.commitModificationsCB = null; //params : none

	this.loadBaseDoc(baseURI);
}