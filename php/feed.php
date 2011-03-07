<?php
require_once 'include/config.inc.php';
require_once 'include/comet.inc.php';
require_once 'include/MockTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler.inc.php';
require_once 'include/XMLFileTraceHandler.inc.php';
require_once 'include/View.inc.php';

$lastKnownId = $_GET['lastKnownId'];
$lastKnownTime = $_GET['lastKnownTime'];

$piCometMethod = $_GET['PICometMethod'];
$viewId = $_GET['viewId'];

$traceHandler = $_GET['traceHandler'];
$traceRef = $_GET['traceRef'];
$traceModel = $_GET['traceModel'];

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
$viewInfos = new ViewInfos();
$viewInfos->loadFromFile($viewId)
	or die();

$view = new View($viewInfos);

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
do
{
	$obsel = $trace->getNextObsels($lastKnownId, $lastKnownTime);
	$svgElt = $view->transformSingles($obsel);
	pushElement($svgElt);
}while(! connection_aborted() and ! $trace->eot());

if($trace->eot())
{
	pushElement('<eot/>');
}

?>