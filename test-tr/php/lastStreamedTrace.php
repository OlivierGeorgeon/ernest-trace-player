<?php
header("Content-type: text/xml");
require_once 'include/config.inc.php';

$fd = fopen(DATA_DIR . "/stream_id", "r");

if(flock($fd, LOCK_EX))
{
	$last_id = fgets($fd);
	echo "<trace-id>$last_id</trace-id>";
}else{
	echo "<error>Couldn't get the lock on the ID file.</error>";
}

?>