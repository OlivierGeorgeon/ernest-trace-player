<?php
/*$trace = fopen(TEMP_DATA_DIR . '/streams/' . $_GET['traceId'], "r+");
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
	}*/

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';

include_once('include/lib/arc/ARC2.php');

/*set_include_path('./include/lib/');
require_once "EasyRdf.php";
require_once "EasyRdf/Parser/Arc.php";*/

class XMLStreamTraceHandler implements TraceHandler
{
	public function __construct($traceId)
	{
		$this->slices = null;
		$this->traceId = $traceId;
		$this->toAbort = false;
		$this->atEot = false;
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		pushError("Unimplementable");
		die('</feed>');
	}
	
	public function getObsel($obselId)
	{
		pushError("Unimplementable");
		die('</feed>');
	}
	
	public function getNextObsels(&$null1, &$null2)
	{
		if(!$this->slices or ($sliceNode = next($this->slices)) === false)
		{
			if($this->toAbort)
				return false;
			
			if(!file_exists(TEMP_DATA_DIR . '/streams/' . $this->traceId))
			{
				$this->atEot = true;
				return false;
			}
			$this->trace = fopen(TEMP_DATA_DIR . '/streams/' . $this->traceId, "r+");
			
			$data = fread($this->trace, 1024);
			while(strlen($data) == 0)
			{
				if($this->aborted())
					return false;
				usleep(100000);
				$data .= fread($this->trace, 1024);
			}
			
			if(flock($this->trace, LOCK_EX))
			{
				while(! feof($this->trace))
				{
					$data .= fread($this->trace, 1024);
				}
				ftruncate($this->trace, 0);
				rewind($this->trace);
				
				fflush($this->trace);
				flock($this->trace, LOCK_UN);
				fclose($this->trace);
			}else{
				pushError("Couldn't get the lock on the trace file.");
			}
			$this->doc = simplexml_load_string("<contents>" . $data . "</contents>");
			$this->slices = array();
			$slices = $this->doc->children();
			foreach($slices as $slice)
			{
				$this->slices[] = $slice;
			}
			$sliceNode = current($this->slices);
		}
		
		if($sliceNode->getName() == "eot")
		{
			$this->atEot = true;
			unlink(TEMP_DATA_DIR . '/streams/' . $this->traceId);
			return false;
		}
		$slice = $sliceNode->asXML();
		
		return $slice;
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		pushError("Unimplemented");
		die('</feed>');
	}
	
	public function eot()
	{
		return $this->atEot;
	}
	
	public function abortASAP()
	{
		$this->toAbort = true;
	}
	
	public function aborted()
	{
		echo "\n"; flush();
		touch("/tmp/tested-abort");
		if(connection_aborted() or connection_status() != 0)
		{
			return true;
		}else{
			return false;
		}
	}
	
	private $fd;
	private $doc;
	private $atEot;
	private $slices;
}

?>