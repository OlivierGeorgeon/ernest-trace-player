<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
header("Content-type: text/xml");
require_once 'include/tracerIdent.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId'])
	and $traceId = filter_lnd($_REQUEST['traceId']))
{
	postObsel($traceId, "<eot/>");
}

?>