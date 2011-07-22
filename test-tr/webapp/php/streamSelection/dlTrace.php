<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/misc.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['traceId']))
{
	header('Content-Disposition: attachment; filename=' . $_REQUEST['traceId'] . ".xml");
	require_once 'include/session.inc.php';

	echo dbXMLDumpTrace($_REQUEST['traceId']);
}

?>