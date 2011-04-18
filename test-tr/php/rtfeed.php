<?php
$total_time_start = microtime_float();
set_time_limit(0);
ignore_user_abort();

require_once 'include/config.inc.php';
require_once 'include/cometChan.inc.php';
require_once 'include/MockTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler2.inc.php';
require_once 'include/XMLFileTraceHandler.inc.php';
require_once 'include/NamedPipeTraceHandler.inc.php';
require_once 'include/Pipeline.inc.php';


$lastKnownId = isset($_GET['lastKnownId']) ? $_GET['lastKnownId'] : "";
$lastKnownTime = isset($_GET['lastKnownTime']) ? $_GET['lastKnownTime'] : "";

$pipelineId = $_GET['pipelineId'];

$traceHandler = $_GET['traceHandler'];
$traceRef = $_GET['traceRef'];
$traceModel = $_GET['traceModel'];

/**
* Fonction simple identique à celle en PHP 5 qui va suivre
*/
function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

/*
 * Loads the view.
 */
$pipelineInfos = new PipelineInfos();
$pipelineInfos->load($pipelineId)
	or die();

$pipeline = new Pipeline($pipelineInfos);

/*
 * Creates the trace stream handler.
 */
if($traceHandler === "mock")
{
	$trace = new MockTraceHandler();
}else if($traceHandler === "ktbs")
{
	$trace = new KTBSTraceHandler($traceRef, $traceModel);
}else if($traceHandler === "ktbs2")
{
	$trace = new KTBSTraceHandler2($traceRef, $traceModel);
}else if($traceHandler === "file")
{
	$trace = new XMLFileTraceHandler($traceRef);
}else if($traceHandler === "pipe")
{
	$trace = new NamedPipeTraceHandler($traceRef);
}

/*
 * Streams data to the player from the trace handler, transforming it with the view.
 */
header("Content-type: text/xml");
$obsel_doc = new DOMDocument();
echo "<feed>";flush();
$time = 0.0;
$time_obs = 0.0;
$i = 0;
do
{
	$time_start = microtime_float();
	$obsel = $trace->getNextObsels($lastKnownId, $lastKnownTime);
	
	
	if($obsel !== false)
	{
		pushError("XMLDOC: \"\"\"" . $obsel . "\"\"\"");
		$obsel_doc->loadXML($obsel);
		$time_end = microtime_float();
		$time_obs += $time_end - $time_start;
		
		$time_start = microtime_float();
		$svgElt = $pipeline->transform($obsel_doc);
		$time_end = microtime_float();
		$time += $time_end - $time_start;
		
		pushElement($svgElt->saveXML($svgElt->documentElement, LIBXML_COMPACT));
		++$i;
		//pushElement("<error>Everything went smoothly.</error>");
	}else{
		pushError("Couldn't get next event.");
		pushElement('<eot/>');
		die("</feed>");
	}
	
}while($obsel !== false and ! $trace->eot());


if($trace->eot())
{
	pushElement('<eot/>');
}
/*
echo "Transform: $time seconds\n";
echo "GetObsel: $time_obs seconds\n";

$total_time_end = microtime_float();
$time = $total_time_end - $total_time_start;
echo "Total: $time seconds\n";
*/
echo "</feed>\n";flush();

?>