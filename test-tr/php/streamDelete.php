<?php
require_once 'include/config.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId']))
{
	deleteStored($_REQUEST['traceId']);
}
?>