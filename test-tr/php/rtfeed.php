<?php
$total_time_start = microtime_float();
set_time_limit(0);
ignore_user_abort();

require_once 'include/config.inc.php';
require_once 'include/comet.inc.php';
require_once 'include/MockTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler.inc.php';
require_once 'include/XMLFileTraceHandler.inc.php';
require_once 'include/Pipeline.inc.php';


$lastKnownId = $_GET['lastKnownId'];
$lastKnownTime = $_GET['lastKnownTime'];

$piCometMethod = $_GET['PICometMethod'];
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
 * Comet stream. pushElement immediatly sends an element to the player.
 */
$comet = new PIComet($piCometMethod, 'paparapaaaa');
function pushElement($text)
{
	global $comet;
	echo $comet->push($text); flush();
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
}else if($traceHandler === "file")
{
	$trace = new XMLFileTraceHandler($traceRef);
}

/*
 * Streams data to the player from the trace handler, transforming it with the view.
 */
header("Content-type: text/xml");
$obsel_doc = new DOMDocument();
echo "<test>";flush();
$time = 0.0;
$time_obs = 0.0;
$i = 0;
do
{
	$time_start = microtime_float();
	$obsel = $trace->getNextObsels($lastKnownId, $lastKnownTime);
	
	$obsel_doc->loadXML($obsel);
	$time_end = microtime_float();
	$time_obs += $time_end - $time_start;
	
	$time_start = microtime_float();
	$svgElt = $pipeline->transform($obsel_doc);
	$time_end = microtime_float();
	$time += $time_end - $time_start;
	
	pushElement($svgElt->saveXML($svgElt->documentElement, LIBXML_COMPACT));
	++$i;
}while(! connection_aborted() and ! $trace->eot());


if($trace->eot())
{
	pushElement('<eot/>');
}

echo "Transform: $time seconds\n";
echo "GetObsel: $time_obs seconds\n";

$total_time_end = microtime_float();
$time = $total_time_end - $total_time_start;
echo "Total: $time seconds\n";
echo "</test>\n";flush();

?>