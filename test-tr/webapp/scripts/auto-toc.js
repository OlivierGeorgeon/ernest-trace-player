/*
 * http://cf-bill.blogspot.com/2005/09/javascript-build-toc.html
 */

var tocLevels = '6';

function tocInit() {
	// because IE can't handle more than 6 levels; make sure the user hasn't
	// exceeded that amount
	// if you remove this and use IE the script will no longer work if you have
	// invalid H7 tags and beyond.
	if (tocLevels > 6) {
		tocLevels = 6;
	}

	var tags = '';
	var tagNum = 0;
	var tagDetail = new Array(1);
	var tocTagList = '';
	var aNode = '';

	// Build a list of the header tags
	for ( var h = 1; h <= tocLevels; h++) {
		tocTagList = tocTagList + 'H' + h + ',';
	}

	// create an array of those tags
	var tocTagArray = tocTagList.split(',');

	var tags = document.getElementsByTagName("body")[0].childNodes;

	// loop over all objects on the webpage looking for valid header tags
	for ( var ti = 0; ti < tags.length; ti++) {
		if (tocTagList.indexOf(tags[ti].tagName + ',') != -1) {

			// this is used to buid the nested lists later
			currentLevel = tocTagArray.find(tags[ti].tagName);

			// build a unique anchor to embed with the section header
			aNode = document.createElement('a');
			aNode.id = 'tocLink' + tagNum;
			tags[ti].appendChild(aNode);

			// collect some details about the section that we can use to build
			// the TOC with
			tagDetail[tagNum] = tags[ti].tagName + '|' + tagNum + '|';
			if (tags[ti].childNodes.length) {
				tagDetail[tagNum] = tagDetail[tagNum]
						+ tags[ti].childNodes[0].nodeValue + '|' + currentLevel;
			} else {
				tagDetail[tagNum] = tagDetail[tagNum] + ' ' + '|'
						+ currentLevel;
			}

			tagNum++; // used to keep track of how many headers we have found.
		}
	}

	tocBuild(tagDetail);

}

function tocBuild(tagDetail) {

	var lastLevelNum = -1;
	var currentLevelNum = 0;
	var toc = getObjectRefByID('TOC');
	var currentParent = toc;
	var lastObject = currentParent;

	for ( var i = 0; i < tagDetail.length; i++) {
		thisDetail = tagDetail[i].split("|");

		currentLevelNum = thisDetail[3];

		// created a nested unordered list..
		if (currentLevelNum > lastLevelNum) {
			var ulNode = document.createElement("ul");
			currentParent.appendChild(ulNode);
			currentParent = ulNode;
		}
		// move back up the DOM to the right level
		if (currentLevelNum < lastLevelNum) {
			var levelDiff = lastLevelNum - currentLevelNum;
			for (ldi = 0; ldi < levelDiff; ldi++) {
				currentParent = currentParent.parentNode;
			}
		}

		// add the new TOC entry
		var liNode = tocBuildEntry(thisDetail);
		currentParent.appendChild(liNode);

		// keep track of where we are
		lastLevelNum = currentLevelNum;
		lastObject = liNode;
	}

}

function tocBuildEntry(details) {

	var liNode = document.createElement("li");
	var aNode = document.createElement("a");
	var tNode = document.createTextNode(details[2]);

	// className is the same as the tag, ie: H1, H2, etc.
	liNode.className = details[0];
	aNode.className = details[0];

	// embed a link in the LI so we can jump to the correct section
	aNode.href = '#tocLink' + details[1];
	aNode.appendChild(tNode);
	liNode.appendChild(aNode);

	return liNode;

}

/*******************************************************************************
 * HELPER FUNCTIONS
 ******************************************************************************/
function addEvent(elm, evType, fn, useCapture)
// addEvent and removeEvent
// cross-browser event handling for IE5+, NS6 and Mozilla
// By Scott Andrew
{
	if (elm.addEventListener) {
		elm.addEventListener(evType, fn, useCapture);
		return true;
	} else if (elm.attachEvent) {
		var r = elm.attachEvent("on" + evType, fn);
		return r;
	} else {
		alert("Handler could not be removed");
	}
}

function getObjectRefByID(objectId) {
	var element = false;

	// cross-browser function to get an object given its id
	if (document.getElementById && document.getElementById(objectId)) {
		// W3C DOM
		element = document.getElementById(objectId);
	} else if (document.all && document.all(objectId)) {
		// MSIE 4 DOM
		element = document.all(objectId);
	} else if (document.layers && document.layers[objectId]) {
		// NN 4 DOM.. note: this won't find nested layers
		element = document.layers[objectId];
	}

	return element;
}

if (Array.prototype.find) {
	Array.prototype.find = null;
}
if (!Array.prototype.find) {
	function ArrayFind(value) {
		// simply add the element to the end of the array changing the arrays
		// length by +1
		var index = -1;
		for ( var i = 0; i < this.length; i++) {
			if (this[i] == value) {
				index = i;
				break;
			}
		}
		return index;
	}
	// set the Arrays push method equal to our ArrayPush function
	Array.prototype.find = ArrayFind;
}

// builds the TOC when the page is loaded.
addEvent(window, "load", tocInit);
