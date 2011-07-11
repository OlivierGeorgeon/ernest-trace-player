<?php
require_once 'include/session.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId']) and $traceId = filter_lnd($_REQUEST['traceId']))
{
	deleteStored($traceId);
}
?>