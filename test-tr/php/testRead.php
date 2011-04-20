<html>
<?php
require_once 'include/config.inc.php';

if(isset($_GET['traceId']))
{
	$trace = fopen(TEMP_DATA_DIR . '/streams/' . $_GET['traceId'], "r+");
	stream_set_blocking($trace, 1);
	
	for ($i = 0; $i < 5; $i++) {
		$data = fread($trace, 1024);
		while(strlen($data) == 0)
		{
			usleep(100000);
			$data = fread($trace, 1024);
		}
		
		if(flock($trace, LOCK_EX))
		{
			while(! feof($trace))
			{
				$data .= fread($trace, 1024);
			}
			ftruncate($trace, 0);
			rewind($trace);
			
			flock($trace, LOCK_UN);
		}else{
			echo "<error>Couldn't get the lock on the trace file.</error>";
		}
		
		//echo "Received :\"\"\"$data\"\"\"<br>"; flush();
	}
}
?>
</html>