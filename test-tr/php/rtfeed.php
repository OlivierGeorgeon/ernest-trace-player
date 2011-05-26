<?php
$total_time_start = microtime_float();

require_once 'include/config.inc.php';
require_once 'include/cometChan.inc.php';
require_once 'include/MockTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler.inc.php';
require_once 'include/KTBSTraceHandler2.inc.php';
require_once 'include/XMLFileTraceHandler.inc.php';
require_once 'include/NamedPipeTraceHandler.inc.php';
require_once 'include/XMLStreamTraceHandler.inc.php';
require_once 'include/XMLStreamComposerHandler.inc.php';
require_once 'include/ComposerHandler.inc.php';
require_once 'include/Pipeline.inc.php';
require_once 'include/XMLFragmentFileTraceHandler.inc.php';

$lastKnownId = isset($_GET['lastKnownId']) ? $_GET['lastKnownId'] : "";
$lastKnownTime = isset($_GET['lastKnownTime']) ? $_GET['lastKnownTime'] : "";

$pipelineId = $_GET['pipelineId'];
$cleanup =  isset($_GET['cleanup']);

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

$pipeline = new Pipeline($pipelineInfos, $cleanup);

/*
 * Creates the trace stream handler.
 */
/*
 * ~ ~ ~ ~ :'(
 if($traceHandler === "mock")
 {
 $trace = new MockTraceHandler();
 }elseif($traceHandler === "ktbs")
 {
 $trace = new KTBSTraceHandler($traceRef, $traceModel);
 }elseif($traceHandler === "ktbs2")
 {
 $trace = new KTBSTraceHandler2($traceRef, $traceModel);
 }elseif($traceHandler === "file")
 {
 $trace = new XMLFileTraceHandler($traceRef);
 }elseif($traceHandler === "pipe")
 {
 $trace = new NamedPipeTraceHandler($traceRef);
 }else*/
$traces = "";
if($traceHandler === "stream")
{
	$trace = new XMLStreamTraceHandler($traceRef);
}elseif($traceHandler === "storedstream")
{
	$trace = new XMLFragmentFileTraceHandler($traceRef, $lastKnownTime);
}

$config = new XMLStreamTraceHandler("__config__");
$traces = new ComposerHandler(array($trace, $config));

/*
 * Streams data to the player from the trace handler, transforming it with the view.
 */

$obsel_doc = new DOMDocument();
echo "<feed>";flush();
$time = 0.0;
$time_obs = 0.0;
$i = 0;
do
{
	$time_start = microtime_float();
	list($source, $obsel) = $traces->getNextObsels($lastKnownId, $lastKnownTime);

	if($obsel !== false)
	{
		$obsel_doc->loadXML($obsel);
		$time_end = microtime_float();
		$time_obs += $time_end - $time_start;

		$time_start = microtime_float();
		$svgElt = $pipeline->transform($obsel_doc, $source->traceId);
		$time_end = microtime_float();
		$time += $time_end - $time_start;

		pushElement($svgElt->saveXML($svgElt->documentElement, LIBXML_COMPACT));

		++$i;
		if($i > 100)
		$traces->abortASAP();
	}else{
		if($source !== false)
		{
			pushError("Couldn't get next event from " . $source->traceId);
			if($source->eot())
			{
				pushElement('<eot trace="' . $source->traceId . '"/>');
			}
		}
	}
}while(! ($obsel === false and $source === false) and $traces->eot() !== true);


if($traces->eot())
{
	pushElement('<eot/>');
	$pipeline->cleanStates();
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