<?php

require_once('include/ViewInfos.inc.php');

if(isset($_GET['viewId']))
{
	$viewId = $_GET['viewId'];
	
	$viewInfos = new ViewInfos();
	$viewInfos->loadFromFile($viewId);
	
	header("Content-type: text/xml");
	$viewInfos->passViewInfosXMLFile();
}

?>