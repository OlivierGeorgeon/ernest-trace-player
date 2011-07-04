<?php
require_once 'include/config.inc.php';
require_once 'include/cometChan.inc.php';
require_once 'include/Pipeline.inc.php';
require_once 'include/DBAndSocketHandler.inc.php';
require_once 'include/Trace.inc.php';

$lastKnownId = isset($_GET['lastKnownId']) ? $_GET['lastKnownId'] : "";
$lastKnownTime = isset($_GET['lastKnownTime']) ? $_GET['lastKnownTime'] : "";

$pipelineId = $_GET['pipelineId'];
$cleanup =  isset($_GET['cleanup']);

$traceHandler = $_GET['traceHandler'];
$traceRef = $_GET['traceRef'];
$traceModel = $_GET['traceModel'];

/*
 * Loads the pipeline.
 */
$pipelineInfos = new PipelineInfos();
$pipelineInfos->load($pipelineId)
	or die();

$pipeline = new Pipeline($pipelineInfos, $cleanup);

/*
 * Creates the trace stream handler.
 */
if($traceHandler === "stream")
{
	$trace = new Trace($traceRef, isset($lastKnownTime) ? $lastKnownTime : false);
	$config = new Trace("__config__", false, true);
	$traces = new DBAndSocketHandler();
	$traces->addTrace($trace);
	$traces->addTrace($config);
}

/*
 * Streams data to the player from the trace handler, transforming it with the view.
 */

$obsel_doc = new DOMDocument();
echo "<feed>";flush();
$i = 0;
do
{
	list($source, $obsel) = $traces->getNextObsels($lastKnownId, $lastKnownTime);

	if($obsel !== false)
	{
		$obsel_doc->loadXML($obsel);

		$svgElt = $pipeline->transform($obsel_doc, $source->getId());

		pushElement($svgElt->saveXML($svgElt->documentElement, LIBXML_COMPACT));

		++$i;
		if($i > 100)
		{
			$traces->abortASAP();
		}
	}else{
		if($source !== false)
		{
			pushError("Couldn't get next event from " . $source->getId());
			if($source->eot())
			{
				pushElement('<eot trace="' . $source->getId() . '"/>');
			}
		}
	}
}while(! ($obsel === false and $source === false) and $traces->eot() !== true);

if($traces->eot())
{
	pushElement('<eot/>');
	$pipeline->cleanStates();
}
echo "</feed>\n";flush();

?>