/*
 *   Copyright (C) 2011  LIRIS
 *
 *
 *   This file is part of Abstract XML.
 *
 *   Abstract XML is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   any later version.
 *
 *   Abstract XML is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/*
 * From  http://stackoverflow.com/questions/1997661/unique-object-identifier-in-javascript
 * 
 * Sets a unique identifier to each object when toString'd, and embed it in the string. 
 * Meant for debuging purpose. Disabled because it somehow breaks the scripts (!!!).
 */
/*Object.prototype.__defineGetter__('__id__', function () {
    var gid = 0;
    return function(){
        var id = gid++;
        this.__proto__ = {
             __proto__: this.__proto__,
             get __id__(){ return id }
        };
        return id;
    }
}.call() );

Object.prototype.toString = function () {
    return '[Object ' + this.__id__ + ']';
};*/

/*	
 * From http://onemarco.com/2008/11/12/callbacks-and-binding-and-callback-arguments-and-references/
 * 
 * Used to parametrize callbacks easily.
 * 
 * @param {Function} func the callback function
 * @param {Object} opts an object literal with the following
 * properties (all optional):
 * scope: the object to bind the function to (what the "this" keyword will refer to)
 * args: an array of arguments to pass to the function when it is called, these will be
 * appended after any arguments passed by the caller
 * suppressArgs: boolean, whether to supress the arguments passed
 * by the caller.  This default is false.
 * 
 * e.g. call : 
 * takesCallback(
 * 	callback(myFunction, {scope: myThisObject, args: [myArgOne, myArgTwo], suppressArgs: false})
 * );
 */
function parametrizeCallback(func, opts)
{
	var cb = function(){
		var args = opts.args ? opts.args : [];
		var scope = opts.scope ? opts.scope : this;
		var fargs = opts.supressArgs === true ?
			[] : toArray(arguments);
		return func.apply(scope, fargs.concat(args));
	}
	return cb;
}

/* A utility function for callback() */
function toArray(arrayLike){
	var arr = [];
	for(var i = 0; i < arrayLike.length; i++){
		arr.push(arrayLike[i]);
	}
	return arr;
}

/*
 * Generates an unused id.
 */
function getFreeId()
{
	var freeIdCounter = 0;
	
	while(document.getElementById("autoId" + freeIdCounter) != null)
	{
		freeIdCounter++;
	}
	
	return "autoId" + freeIdCounter;
}

/*
 * Search for child nodes with the given title.
 */
function getElementsByTitle(elem, title, recursive, elemWasPushed)
{
	if(recursive == undefined)
		recursive = false;
	if(elemWasPushed == undefined)
		elemWasPushed = false;
	
	var elements = new Array();
	for(var i = 0; i < elem.childNodes.length; i++)
	{
		pushed = false;
		if((elem.childNodes[i].getAttribute && elem.childNodes[i].getAttribute('title') == title))
		{
			elements.push(elem.childNodes[i]);
			pushed = true;
		}else if(! elemWasPushed){ // Inkscape compat £#*$&
			if( elem.childNodes[i].tagName == "title" && elem.childNodes[i].textContent == title )
			{
				elements.push(elem);
			}
		}
		
		if(recursive)
			elements = elements.concat(getElementsByTitle(elem.childNodes[i], title, true, pushed));
	}
	return elements;
}

var svgns = "http://www.w3.org/2000/svg";
function parseSVGNodeIntoFragment(svgString, svgDoc)
{
	//svg = $.xmlDOM(svgString);
	svg = $(svgString);
	frag = svgDoc.createDocumentFragment();
	copyTree(svg, frag);
	return frag;
}

function copyTree(jt, st)
{
        jt.children().each(function(){
                var e = document.createElementNS(svgns, this.tagName);
                $.each(this.attributes, 
                		function(k, a){
                		if(a.namespaceURI == undefined || a.namespaceURI === null || a.namespaceURI == "http://www.w3.org/2000/xmlns/")
                			e.setAttribute(a.nodeName, a.nodeValue);
                		else{
                			e.setAttributeNS(a.namespaceURI, a.localName, a.nodeValue);
                		}
                });
                
                if (this.textContent && this.textContent.length > 0 &&
                		$(this).children().length === 0) {
                			e.textContent = this.textContent;
                }else{
                    copyTree($(this), e);
                }
                
                st.appendChild(e);
        });
        
}

function translateSVGNode(node, dx, dy){
	try
	{
		if (node.transform && node.ownerSVGElement && node.ownerSVGElement.createSVGTransform){
			var t = node.ownerSVGElement.createSVGTransform();
			t.setTranslate(dx, dy);
			node.transform.baseVal.appendItem(t);
		}
	}
	catch(err)
	{
		alert(err);
	}
};


function reTranslateSVGNode(node, dx, dy){
	//try
	//{
		if (node.transform && node.transform && node.transform.baseVal.numberOfItems == 1){
			/*var t = node.ownerSVGElement.createSVGTransform();
			t.setTranslate(dx, dy);
			node.transform.baseVal.appendItem(t);*/
			node.transform.baseVal.getItem(0).setTranslate(dx, dy);
		}
	//}
	//catch(err)
	//{
	//	alert(err);
	//}
};

function clearSVGNodeTRansformations(node){
	if (node.transform){
		node.transform.baseVal.clear();
	}
};

function scaleSVGNode(node, scaleX, scaleY){
	if (!scaleY) var scaleY = scaleX;
	if (node.transform && node.ownerSVGElement && node.ownerSVGElement.createSVGTransform)
	{
		var t = node.ownerSVGElement.createSVGTransform();
		t.setScale(scaleX, scaleY);
		node.transform.baseVal.appendItem(t);
	}
};



