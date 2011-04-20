<?php
require_once 'include/config.inc.php';

if(isset($_POST['traceId']) && isset($_POST['data']))
{
	$trace = fopen(TEMP_DATA_DIR . '/streams/' . $_POST['traceId'], "a+");
	if(flock($trace, LOCK_EX))
	{
		fseek($trace, -1, SEEK_END);
		fwrite($trace, $_POST['data']);
		fflush($trace);
		fclose($trace);
	}else{
		echo "<error>Couldn't get the lock on the trace file.</error>";
	}
	
	//TODO: create the necessary files/folder/streams
	//TODO: store the traces
	//TODO: use better storage solution (sqlite ?)
}
?>