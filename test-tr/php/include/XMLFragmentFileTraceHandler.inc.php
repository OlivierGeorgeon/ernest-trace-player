<?php

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';
require_once 'include/config.inc.php';

include_once('include/lib/arc/ARC2.php');

/*set_include_path('./include/lib/');
require_once "EasyRdf.php";
require_once "EasyRdf/Parser/Arc.php";*/

class XMLFragmentFileTraceHandler implements TraceHandler
{
	public function __construct($traceId, $lastKnownTime)
	{
		$this->traceId = $traceId;
		$this->atEot = false;
		
		$this->trace = simplexml_load_string(
			"<sequence>"
			. file_get_contents(DATA_DIR . '/xml_trace_fragments/' . $this->traceId)
			. "</sequence>"
		);
		
		if($lastKnownTime != "")
			$this->events = $this->trace->xpath("/sequence/*[@date > $lastKnownTime]");
		else
			$this->events = $this->trace->xpath("/sequence/*");
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		pushError("Unimplemented");
		return false;
	}
	
	public function getObsel($obselId)
	{
		pushError("Unimplemented");
		return false;
	}
	
	/*
	 * Non-blocking, as the file won't be growing.
	 */
	public function getNextObsels(&$lastKnownId, &$lastKnownTime)
	{
		if($event = current($this->events))
		{
			next($this->events);
			 
			if($event->getName() == "eot")
			{
				$this->atEot = true;
				return false;
			}
			$slice = $event->asXML();
			
			return $slice;
		}else{
			$this->atEot = true;
			return false;
		}
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		return $this->getNextObsels(&$lastKnownId, &$lastKnownTime);
	}
	
	public function eot()
	{
		return $this->atEot;
	}

	public function abortASAP()
	{}
	
	private $atEot;
	private $traceFilename;
}


?>
