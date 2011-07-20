<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/tracerIdent.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId'])
	and isset($_REQUEST['data'])
	and $traceId = filter_lnd($_REQUEST['traceId']))
{
	postObsel($traceId, $_REQUEST['data']);
}
?>