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
		while(strlen($line) == 0)
		{
			pushError("Error while reading size, reopenning the file.");
			fclose($this->fd);
			$this->fd = fopen($fileName, "r");
			$line = fgets($this->fd);
			sleep(1);
		}
		//pushError("Read : '$line'.");
		
		
		//list($len) = fscanf($this->fd, "%i");
		$len = intval($line);
		$message = fread($this->fd, $len);
		
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
		
		return "<slice>" . $message . "</slice>";
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		die("<error>Unimplemented</error>");
	}
	
	public function eot()
	{
		return false;
	}
	
	private $fd;
}


?>