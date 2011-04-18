<?php

require_once('include/PipelineInfos.inc.php');

if(isset($_GET['pipelineId']))
{
	$pipelineId = $_GET['pipelineId'];
	
	$pipelineInfos = new PipelineInfos();
	$pipelineInfos->load($pipelineId);
	
	header("Content-type: text/xml");
	$pipelineInfos->passInfosXML();
}

?>