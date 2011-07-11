<?php
require_once 'include/tracerIdent.inc.php';

if(isset($_REQUEST['traceId'])
	and $traceId = filter_lnd($_REQUEST['traceId']))
{
	// Nuthin' to do
	/*
	@mkdir(TEMP_DATA_DIR . '/streams');
	$fd = fopen(TEMP_DATA_DIR . '/streams/' . $traceId, "w");
	ftruncate($fd, 0);
	fflush($fd);
	fclose($fd);*/
}else{
	touch(DATA_DIR . "/stream_id");
	$fd = fopen(DATA_DIR . "/stream_id", "r+");

	if(flock($fd, LOCK_EX))
	{
		$last_id = fgets($fd);
		$id = intval($last_id) + 1;
		ftruncate($fd, 0);
		rewind($fd);
		fwrite($fd, $id);
		fclose($fd);

		echo $id;

		// Nuthin' to do
		/*@mkdir(TEMP_DATA_DIR . '/streams');
		touch(TEMP_DATA_DIR . '/streams/' . $id);*/
	}else{
		echo "<error>Couldn't get the lock on the ID file.</error>";
	}
}
?>