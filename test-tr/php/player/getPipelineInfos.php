<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once('include/PipelineInfos.inc.php');

if(isset($_GET['pipelineId']) and $pipelineId = filter_lnd($_GET['pipelineId']))
{
	$pipelineInfos = new PipelineInfos();
	$pipelineInfos->load($pipelineId);

	header("Content-type: text/xml");
	$pipelineInfos->passInfosXML();
}

?>