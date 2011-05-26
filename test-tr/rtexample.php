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
