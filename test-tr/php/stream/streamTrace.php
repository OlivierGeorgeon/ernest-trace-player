<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/tracerIdent.inc.php';
require_once 'include/stream.inc.php';

system("echo 'stream " . $_REQUEST['traceId'] . " " . DATA_DIR . '/trace_fragments.db' . "...' >> /tmp/streamit");

if(isset($_REQUEST['traceId'])
	and isset($_REQUEST['data'])
	and $traceId = filter_lnd($_REQUEST['traceId']))
{
	system("echo 'OK\n' >> /tmp/streamit");
	postObsel($traceId, $_REQUEST['data']);
}else{
	system("echo 'KO\n' >> /tmp/streamit");
}
?>