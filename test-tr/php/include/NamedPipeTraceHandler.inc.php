<?php

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';

include_once('include/lib/arc/ARC2.php');

/*set_include_path('./include/lib/');
require_once "EasyRdf.php";
require_once "EasyRdf/Parser/Arc.php";*/

class NamedPipeTraceHandler implements TraceHandler
{
	public function __construct($fileName)
	{
		$this->fd = fopen($fileName, "r");
		//stream_set_blocking($this->fd, 0);
		@unlink("/tmp/trnp");
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		die("<error>Unimplementable</error>");
	}
	
	public function getObsel($obselId)
	{
		die("<error>Unimplementable</error>");
	}
	
	public function getNextObsels(&$null1, &$null2)
	{
		$line = fgets($this->fd);
		
		/*while($line === false and !$this->aborted())
		{
			usleep(100000);
			$line = fgets($this->fd);
		}*/
		
		while(strlen($line) == 0 and !$this->aborted())
		{
			pushError("Error while reading size, reopenning the file.");
			fclose($this->fd);
			$this->fd = fopen($fileName, "r");
			$line = fgets($this->fd);
			sleep(1);
		}
		//pushError("Stat : " . var_export(fstat($this->fd), true) . "");
		$message = "";
		$len = intval($line);
		$message .= fread($this->fd, $len);
		/*
		$line = fgets($this->fd);
		while($line !== false and !$this->aborted())
		{
			$len = intval($line);
			$message .= fread($this->fd, $len);
			$line = fgets($this->fd);
		}*/
		
		$a = fopen("/tmp/trnp", "a+");
		fwrite($a, "\n\n$len\n");
		if($error = error_get_last())
		{
			fwrite($a, "<error> Execution errors detected: " . implode('\n', $error) . ".</error>");
			//pushError("Execution errors detected: " . implode('\n', $error));
		}else{
			fwrite($a, "I read: \"\"\"" . $message . "\"\"\"\n");
		}
		fclose($a);
		
		return $message;
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		die("<error>Unimplemented</error>");
	}
	
	public function eot()
	{
		return false;
	}
	
	public function aborted()
	{
		echo "\n"; flush();
		if(connection_aborted() or connection_status() != 0)
		{
			return true;
		}else{
			return false;
		}
	}
	
	private $fd;
}


?>