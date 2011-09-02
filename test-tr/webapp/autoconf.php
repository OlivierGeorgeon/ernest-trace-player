<?php
header("Content-type", "application/xhtml+xml");
require_once ('php/include/guestSession.inc.php');
require_once ('php/include/loadPublicTransformation.inc.php');
echo '<?xml version="1.0" encoding="utf-8"?>';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<link rel="stylesheet" type="text/css" href="css/conf.css" />

<!-- <script type="text/javascript" src="js/lib/jquery-1.5.min.js"></script> -->
<script type="text/javascript" src="js/lib/jquery-1.6.2.min.js"></script>
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

<script type="text/javascript">
function init_start_player()
{
	$("#clear-notices").click(parametrizeCallback(function(e, noticeDiv)
			{
				noticeDiv.empty();
			},
			{args: [$("#my-player-thin-notices-div")]}
	));

	configEditor = null;
	streamSelector = new StreamSelector(
		"stream-selector", "my-player-thin-notices-div", "<?=dirname($_SERVER['SCRIPT_NAME'])?>",
		{
			div_id: "my-player-thin-div",
			notice_div_id: "my-player-thin-notices-div",
			pipeline: "pipeline"
		},
		configEditor
	);

	$("#clear-player").click(parametrizeCallback(function(e, streamSelector)
			{
				streamSelector.cleanPlayer();
			},
			{args: [streamSelector]}
	));
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
	<title>Abstract Lite</title>
	<link rel="icon" href="images/favicon.ico" type="image/ico"/>	
</head>

<body>
	<!-- Trace display -->
	<div id="my-player-thin-div" style="top: 0px; position: relative"></div>
	
	<!-- Trace list -->
	<div style="display: table-cell">
			<div id="stream-selector"></div>
	</div>
	<br />
	<div style="display: inline-block;left: 0px; right: 0px; border: 1px solid gray; padding: 5px; margin: 1px 1px 1px 5px;color: gray">Cookie for streaming a trace to this page:<br/> <?=$_SESSION['cookie']?></div>
		<!-- Notification area -->
	<!-- <div style="display: block; position: absolute; z-index: -1; right: 0; margin-right: 2em; border: 1px solid gray">Information messages</div>
	<div style="font-size: 65%; height: 200px; right: 0; overflow: auto; border: 1px solid gray; background: rgba(255, 255, 255, 0.6);">
		<span id="my-player-thin-notices-div" style="background: rgba(255, 255, 255, 0.9)" />
	</div>
	<button id="clear-notices">Clear</button>
	<br /> -->

</body>
</html>
