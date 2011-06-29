<?php
header("Content-type", "application/xhtml+xml");
echo '<?xml version="1.0" encoding="utf-8"?>';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<link rel="stylesheet" type="text/css" href="css/conf.css" />

<link rel="stylesheet" type="text/css"
	href="js/lib/codemirror/codemirror.css" />
<link rel="stylesheet" type="text/css"
	href="js/lib/codemirror/mode/xml/xml.css" />
<link rel="stylesheet" type="text/css"
	href="js/lib/codemirror/mode/clike/clike.css" />
<link rel="stylesheet" type="text/css"
	href="js/lib/codemirror/mode/javascript/javascript.css" />
<link rel="stylesheet" type="text/css"
	href="js/lib/codemirror/mode/css/css.css" />

<!-- <script type="text/javascript" src="js/lib/jquery-1.5.min.js"></script> -->
<script type="text/javascript" src="js/lib/jquery-1.5.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.xmldom-1.0.min.js"></script>
<script type="text/javascript" src="js/lib/jquery.tooltip.js"></script>
<script type="text/javascript" src="js/lib/pi.1.1.1.min.js"></script>
<script type="text/javascript" src="js/lib/pi.comet.1.2.js"></script>

<script type="text/javascript" src="js/misc.js"></script>
<script type="text/javascript" src="js/TracePlayer2.js"></script>
<script type="text/javascript" src="js/Player2.js"></script>
<script type="text/javascript" src="js/Displayer.js"></script>
<script type="text/javascript" src="js/AInInterpreter.js"></script>
<script type="text/javascript" src="js/StreamControler.js"></script>
<script type="text/javascript" src="js/SVGTrace.js"></script>
<script type="text/javascript" src="js/StreamSelector.js"></script>
<script type="text/javascript" src="js/ConfigEditor.js"></script>
<script type="text/javascript" src="js/FileLister.js"></script>
<script type="text/javascript" src="js/Editor.js"></script>

<script type="text/javascript" src="js/lib/codemirror/codemirror.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/xml/xml.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/php/php.js"></script>
<script type="text/javascript"
	src="js/lib/codemirror/mode/clike/clike.js"></script>
<script type="text/javascript"
	src="js/lib/codemirror/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/css/css.js"></script>
<!-- <script type="text/javascript" src="js/codemirror093/codemirror.js"></script>-->
<script type="text/javascript">
function init_start_player()
{
	//myPlayer2 = new TracePlayer2("my-player-thin-div", "my-player-thin-notices-div", "exemple", "stream", "test", "", "/abstract/Ernest-trace-player-test-tr");
	//myPlayer2 = new TracePlayer2("my-player-thin-div", "my-player-thin-notices-div", "exemple", "pipe", "/home/pierreyves/temp/ernest-trace", "", "/abstract/Ernest-trace-player-test-tr");
	//myPlayer2 = new TracePlayer2("my-player-thin-div", "exemple", "ktbs2", "http://localhost:8001/IDEAL/test99/", "http://salade.dyndns.org/nomodel#", "/abstract/Ernest-trace-player-test-tr");
	//myPlayer2 = new TracePlayer2("my-player-thin-div", "exemple", "file", "92-07.xml", "", "/abstract/Ernest-trace-player-test-tr");
	//myPlayer2.start();
	
	$("#clear-notices").click(parametrizeCallback(function(e, noticeDiv)
			{
				noticeDiv.empty();
			},
			{args: [$("#my-player-thin-notices-div")]}
	));
	
	configEditor = new ConfigEditor("config-editor", "my-player-thin-notices-div", "/abstract/Ernest-trace-player-test2-tr");
	
	streamSelector = new StreamSelector(
		"stream-selector", "my-player-thin-notices-div", "/abstract/Ernest-trace-player-test2-tr",
		{
			div_id: "my-player-thin-div",
			notice_div_id: "my-player-thin-notices-div",
			pipeline: "exemplereconf1"
		},
		configEditor
	);

	$("#clear-player").click(parametrizeCallback(function(e, streamSelector)
			{
				streamSelector.cleanPlayer();
			},
			{args: [streamSelector]}
	));

	fileLister = new FileLister("lister-div", "editor-div", "/abstract/Ernest-trace-player-test2-tr");

	//$("#test-svg").html('<svg xmlns="http://www.w3.org/2000/svg" version="2.0" width="1000" height="240" viewBox="0 -120 1000 240 " title="user-element-shifter" style="width: 2000px; "><g id="my-player-thin-div-1-select-normalize-ns" obsel-id="1-select-normalize" date="0" stroke="#000000" title="obsel" transform="translate(0 0)"><g fill="#000000"><g transform="translate(0,-110)"><polyline style="stroke:#DDDDDD;stroke-width:1pt" points="0,-3 0,220 "/><g transform="translate(2,-5) rotate(90)"><text style="font-size:9px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;stroke:none;font-family:Sans">0</text></g></g></g></g><g id="my-player-thin-div-1-select-normalize-s" obsel-id="1-select-normalize" date="0" begin="0" end="0" stroke-width="1pt" stroke="#000000" title="obsel" transform="translate(-3.33333 0) scale(6.66667 1)"><g transform="skewY(0) translate(0,0)"><g fill="#E6CF00"><rect x="0" width="1" height="2" stroke="none" y="77"/></g><g fill="#E6CF00"><rect x="0" width="1" height="2" stroke="none" y="79"/></g><g fill="#E6CF00"><rect x="0" width="1" height="2" stroke="none" y="81"/></g><g fill="#008000"><rect x="0" width="1" height="2" stroke="none" y="83"/></g><g fill="#2EE600"><rect x="0" width="1" height="2" stroke="none" y="85"/></g><g fill="#008000"><rect x="0" width="1" height="2" stroke="none" y="87"/></g><g fill="#E37CFF"><rect x="0" width="1" height="2" stroke="none" y="89"/></g><g fill="#E37CFF"><rect x="0" width="1" height="2" stroke="none" y="91"/></g><g fill="#008000"><rect x="0" width="1" height="2" stroke="none" y="93"/></g><g fill="#008000"><rect x="0" width="1" height="2" stroke="none" y="95"/></g><g fill="#008000"><rect x="0" width="1" height="2" stroke="none" y="97"/></g><g fill="#008000"><rect x="0" width="1" height="2" stroke="none" y="99"/></g></g></g></svg>')
}

function changeAutoStream(check)
{
	if(check.checked)
	{
		streamSelector.setAutoLast(true);
	}else{
		streamSelector.setAutoLast(false);
	}
}

$(document).ready(function()
{
	init_start_player();
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Trace player example</title>
</head>

<body>
<!-- <div id="my-player-div" ></div> -->
<div id="my-player-thin-div" style="top: 0px; position: relative"></div>
<button id="clear-player">Clear player (debug)</button>
<div id="test-svg"></div>

<div style="display: table-cell" id="config-editor"></div>

<div style="display: table-cell">
<div
	style="display: block; border: 1px solid gray; padding: 7px; padding-top: 2px; margin: 1px 1px 1px 5px;">
<div style="display: block; margin-bottom: 5px; color: gray">Chose the
trace to stream</div>
<div id="stream-selector"></div>
<label><input name="auto-last" type="checkbox" autocomplete="off"
	onchange="changeAutoStream(this)" />Always play last</label></div>
</div>
<br />

<div
	style="display: block; position: absolute; z-index: -1; right: 0; margin-right: 2em; border: 1px solid gray">Information
messages</div>
<div
	style="font-size: 65%; height: 200px; right: 0; overflow: auto; border: 1px solid gray; background: rgba(255, 255, 255, 0.6);">
<span id="my-player-thin-notices-div"
	style="background: rgba(255, 255, 255, 0.9)" /></div>
<button id="clear-notices">Clear</button>
<br />

<div id="editor-div"
	style="border: 1px solid gray; padding: 7px; position: fixed; display: none; left: 10px; top: 10px; right: 10px; z-index: 2; background-color: #FFFFFF; opacity: 1"></div>
<div style="border: 1px solid gray; padding: 7px; margin-top: 5px">
<div style="display: block; margin-bottom: 5px; color: gray">Editable
files</div>
<div id="lister-div"></div>
</div>


</body>
</html>
