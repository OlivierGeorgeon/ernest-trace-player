<?php 
require_once 'php/include/config.inc.php';
header ("Content-Type:application/xhtml+xml");
?>
<?="<?"?>xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<script type="text/javascript" src="js/lib/jquery-1.5.min.js"></script>
<script type="text/javascript" src="js/lib/jquery.xmldom-1.0.min.js"></script>
<script type="text/javascript" src="js/lib/pi.1.1.1.min.js"></script>
<script type="text/javascript" src="js/lib/pi.comet.1.2.js"></script>
<script type="text/javascript" src="js/misc.js"></script>
<script type="text/javascript" src="js/TracePlayer.js"></script>
<script type="text/javascript" src="js/Player.js"></script>
<script type="text/javascript">

function setPlayedTrace(tracename)
{
	$("#my-player-thin-div").empty();
	myPlayer = new TracePlayer("my-player-thin-div", "view_ernest9.2_thin", "view_obsel_tree_html", "file", tracename + ".xml", "", "/abstract/Ernest-trace-player");
	myPlayer.start();
}

function init_start_player()
{
	//myPlayer = new TracePlayer("my-player-div", "view1", "ktbs", "http://localhost:8001/IDEAL/test1/", "http%3A%2F%2Fsalade.dyndns.org%2Fnomodel%23", "/tp");
	//myPlayer = new TracePlayer("my-player-div", "view_ernest1", "view_obsel_tree_html", "file", "ernest_9.1-selected.xml", "", "/abstract/Ernest-trace-player");
	//myPlayer.start();
	myPlayer2 = new TracePlayer("my-player-thin-div", "view_ernest9.2_thin", "view_obsel_tree_html", "file", "ernest_9.2-selected.xml", "", "/abstract/Ernest-trace-player");
	myPlayer2.start();
}

$(document).ready(function()
{
	//init_start_player();
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Trace player example</title>
</head>

<body>
	<!-- <div id="my-player-div" ></div> -->
	<div id="my-player-thin-div" style="top:0px; position:relative; border:2px solid red;"></div>
	<div id="trace-list" style="display:block; position:relative; float:left; border:1px solid gray; padding: 7px; padding-top: 2px;">
	<div style="margin-bottom: 5px;">Chose the trace to display</div>
	<ul><?php 
		$trace_files = scandir(DATA_DIR . "/xml_traces/");
		$trace_files = array_filter($trace_files, function ($element) { return preg_match("/-selected.xml$/", $element); });
		
		foreach($trace_files as &$trace)
		{
			$trace = basename($trace, '.xml');
			echo "<li><a href='javascript:setPlayedTrace(\"" . $trace . "\");'>" . $trace . "</a></li>";			
		}
	?></ul><br/>
	<a href="uploadtrace.xhtml">Upload a new trace</a><br/></div>
</body>
</html>