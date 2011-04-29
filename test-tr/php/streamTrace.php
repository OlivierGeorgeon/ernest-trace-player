<?php
require_once 'include/config.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId']) && isset($_REQUEST['data']))
{
	postObsel($_REQUEST['traceId'], $_REQUEST['data']);
}
?>