<?php

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';
require_once 'include/config.inc.php';

include_once('include/lib/arc/ARC2.php');

/*set_include_path('./include/lib/');
require_once "EasyRdf.php";
require_once "EasyRdf/Parser/Arc.php";*/

class XMLFileTraceHandler implements TraceHandler
{
	public function __construct($traceFile)
	{
		$this->traceFilename = $traceFile;
		$this->atEot = false;
		
		$this->trace = simplexml_load_file(DATA_DIR . '/xml_traces/' . $this->traceFilename);
		$this->events = current($this->trace->children());
		/*var_dump(current($this->events));
		next($this->events);
		var_dump(current($this->events));
		next($this->events);
		var_dump(current($this->events));
		next($this->events);
		die();*/
		
		/*$f = function() { echo "toto"; die();};
		set_error_handler($f, E_ALL);*/
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		$trace = simplexml_load_file(DATA_DIR . '/xml_traces/' . $this->traceFilename);
		$obsels = $trace->xpath('/sequence/event[number(@date) <= ' . $timestampEnd . ' and number(@date) >= '. $timestampBegin . ']');
		return $this->slice($obsels);
	}
	
	public function getObsel($obselId)
	{
		$trace = simplexml_load_file(DATA_DIR . '/xml_traces/' . $this->traceFilename);
		$obsels = $trace->xpath('/sequence/event[@id = ' . $obselId . ']');
		return $this->slice($obsels);
	}
	
	protected function slice($obsels)
	{
		$xmlStr = "<slice>";
		foreach($obsels as $obsel)
		{
			if(! is_object($obsel))
			{
				var_dump($obsel);
				die('tutuuu');
			}
			
			$xmlStr .= $obsel->asXML();
			
			if(isset($php_errormsg))
			{
				echo "\n";
				echo $php_errormsg;
				die();
			}
			if(! is_string($xmlStr))
			{
				var_dump($obsel);
				die('tutuuu');
			}
		}
		$xmlStr .= "</slice>";
		return $xmlStr;
	}
	
	/*
	 * Non-blocking, as the file won't be growing.
	 */
	public function getNextObsels(&$lastKnownId, &$lastKnownTime)
	{
		/*if($lastKnownId != "")
		{
			$obsels = $this->trace->xpath('/sequence/event[number(@id) > $lastKnownId]');
		}else{
			$obsels = $this->trace->xpath('/sequence/event[1]');
		}*/
		
		
		if($temp = next($this->events))
		{
			$obsels[] = $temp;
			if($temp = next($this->events))
				$obsels[] = $temp;
		}else{
			$obsels = false;
		}
		
		// Like it'd work...
		//$lastObsel = $trace->xpath('/sequence/obsel[number(@id) = math:max(number(/sequence/obsel@id))]');
		//$lastKnownTime = $lastObsel->date;
		//$lastKnownId = $lastObsel['id'];
		
		
		if(count($obsels) == 0 || $obsels === false)
		{
			$this->atEot = true;
			
			return "<slice/>";
		}else{
			foreach($obsels as $obsel)
			{
				$lastKnownTime = max(floatval($obsel['date']), $lastKnownTime);
				$lastKnownId = max(floatval($obsel['id']), $lastKnownId);
			}
			
			return $this->slice($obsels);
		}
		
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		$trace = simplexml_load_file(DATA_DIR . '/xml_traces/' . $this->traceFilename);
		
		if($lastKnownId != "")
			$obsels = $trace->xpath('/sequence/event[number(@id) > '. $lastKnownId . ']');
		else
			$obsels = $trace->xpath('/sequence/event');
		
		$lastObsel = $trace->xpath('/sequence/event[@id=math:max(/sequence/event@id)]');
		
		$lastKnownTime = $lastObsel['date'];
		$lastKnownId = $lastObsel['id'];
	
		if(count($obsels) == 0)
		{
			$this->atEot = true;
		}
		
		return $this->slice($obsels);
	}
	
	public function eot()
	{
		return $this->atEot;
	}
	
	private $atEot;
	private $traceFilename;
}


?>
