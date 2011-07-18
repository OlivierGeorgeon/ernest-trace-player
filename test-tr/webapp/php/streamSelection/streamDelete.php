<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/session.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId']) and $traceId = filter_lnd($_REQUEST['traceId']))
{
	deleteStored($traceId);
}
?>