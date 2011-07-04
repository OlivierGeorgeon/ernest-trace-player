<?php
header("Content-type: text/xml");
require_once 'include/config.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId']))
{
	postObsel($_REQUEST['traceId'], "<eot/>");
}

?>