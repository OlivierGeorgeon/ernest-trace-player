<?php
header("Content-type: text/xml");

require_once 'include/config.inc.php';
require_once 'include/View.inc.php';
require_once 'include/MockTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler.inc.php';
require_once 'include/XMLFileTraceHandler.inc.php';

$timeStampBegin = $_GET['timeStampBegin'];
$timeStampEnd = $_GET['timeStampEnd'];
if(isset($_GET['scale']))
	$scale = $_GET['scale'];

$viewId = $_GET['viewId'];
$traceHandler = $_GET['traceHandler'];
$traceRef = $_GET['traceRef'];
$traceModel = $_GET['traceModel'];

/*
 * Loads the view.
 */
$viewInfos = new ViewInfos();
$viewInfos->loadFromFile($viewId);

$view = new View($viewInfos);

/*
 * Creates the trace stream handler.
 */
$trace;
if($traceHandler == "mock")
{
	$trace = new MockTraceHandler();
}else if($traceHandler == "ktbs")
{
	$trace = new KTBSTraceHandler($traceRef, $traceModel);
}else if($traceHandler == "file")
{
	$trace = new XMLFileTraceHandler($traceRef);
}

/*
 * Transforms the slice and echoes it to the player.
 */
$slice = $trace->getObsels(intval($timeStampBegin), intval($timeStampEnd));

$svgElt = $view->transformeSlice($slice, $timeStampBegin, $timeStampEnd, $scale);
echo $svgElt;

?>