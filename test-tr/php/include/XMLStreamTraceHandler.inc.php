<?php

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';

class XMLStreamTraceHandler implements TraceHandler
{
	public function __construct($traceId)
	{
		$this->slices = null;
		$this->traceId = $traceId;
		$this->toAbort = false;
		$this->atEot = false;
		$this->filename = TEMP_DATA_DIR . '/streams/' . $this->traceId;
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
				
			if(!$this->openFile())
			{
				return false;
			}
				
			while(! $data = $this->tryRead())
			{
				if($this->aborted())
				return false;
				usleep(100000);

				$data = $this->tryRead();
			}
				
			$data .= $this->readAndFlush();
				
			$this->computeSlices($data);
				
			$sliceNode = current($this->slices);
		}

		if($sliceNode->getName() == "eot")
		{
			$this->atEot = true;
			unlink($this->filename);
			return false;
		}
		$slice = $sliceNode->asXML();

		return $slice;
	}

	public function openFile()
	{
		if(!file_exists($this->filename))
		{
			$this->atEot = true;
			return false;
		}
		$this->trace = fopen($this->filename, "r+");
		return true;
	}

	public function tryRead()
	{
		$data = fread($this->trace, 1024);

		if(strlen($data) == 0)
		return false;

		return $data;
	}

	public function readAndFlush()
	{
		$data = "";
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
		return $data;
	}

	public function computeSlices($data)
	{
		$this->doc = simplexml_load_string("<contents>" . $data . "</contents>");
		$this->slices = array();
		$slices = $this->doc->children();
		foreach($slices as $slice)
		{
			$this->slices[] = $slice;
		}
	}

	public function getNextObselsNB(&$null1, &$null2)
	{
		if(!$this->slices or ($sliceNode = next($this->slices)) === false)
		{
			if($this->toAbort)
			return false;
				
			if(!$this->openFile())
			{
				return false;
			}
				
			if(! $data = $this->tryRead())
			{
				return false;
			}
				
			$data .= $this->readAndFlush();
				
			$this->computeSlices($data);
				
			$sliceNode = current($this->slices);
		}

		if($sliceNode->getName() === "eot")
		{
			$this->atEot = true;
			unlink($this->filename);
			return false;
		}
		$slice = $sliceNode->asXML();

		return $slice;
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
	//No friend classes in php...
	public $slices;
}

?>