<?php
header("Content-type: text/xml");
require_once 'include/config.inc.php';

if(isset($_POST['traceId']))
{
	$trace = fopen(TEMP_DATA_DIR . '/streams/' . $_POST['traceId'], "a+");
	if(flock($trace, LOCK_EX))
	{
		fseek($trace, -1, SEEK_END);
		fwrite($trace, "<eot/>");
		fflush($trace);
		fclose($trace);
	}else{
		echo "<error>Couldn't get the lock on the trace file.</error>";
	}
}

?>