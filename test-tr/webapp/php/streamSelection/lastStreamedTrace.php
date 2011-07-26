<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
header("Content-type: text/xml");
require_once 'include/session.inc.php';

touch(DATA_DIR . "/stream_id");
$fd = fopen(DATA_DIR . "/stream_id", "r");

if(flock($fd, LOCK_EX))
{
	$last_id = intval(fgets($fd));
	if($last_id == 0)
		$last_id = 1;
	echo "<trace-id>$last_id</trace-id>";
}else{
	echo "<error>Couldn't get the lock on the ID file.</error>";
}

?>