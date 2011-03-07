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
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		$trace = simplexml_load_file(DATA_DIR . '/' . $this->traceFilename);
		$obsels = $trace->xpath('/sequence/obsel[number(@date) <= ' . $timestampEnd . ' and number(@date) >= '. $timestampBegin . ']');
		return $this->slice($obsels);
	}
	
	public function getObsel($obselId)
	{
		$trace = simplexml_load_file(DATA_DIR . '/' . $this->traceFilename);
		$obsels = $trace->xpath('/sequence/obsel[@id = ' . $obselId . ']');
		return $this->slice($obsels);
	}
	
	protected function slice($obsels)
	{
		$xmlStr = "<slice>";
		foreach($obsels as $obsel)
		{
			$xmlStr .= $obsel->asXML();
		}
		$xmlStr .= "</slice>";
		return $xmlStr;
	}
	
	/*
	 * Non-blocking, as the file won't be growing.
	 */
	public function getNextObsels(&$lastKnownId, &$lastKnownTime)
	{
		$trace = simplexml_load_file(DATA_DIR . '/' . $this->traceFilename);
		
		if($lastKnownId != "")
		{
			$obsels = $trace->xpath('/sequence/obsel[number(@id) > '. $lastKnownId . ']');
		}else{
			$obsels = $trace->xpath('/sequence/obsel');
		}
		
		// Like it'd work...
		//$lastObsel = $trace->xpath('/sequence/obsel[number(@id) = math:max(number(/sequence/obsel@id))]');
		//$lastKnownTime = $lastObsel->date;
		//$lastKnownId = $lastObsel['id'];
		
		foreach($obsels as $obsel)
		{
			$lastKnownTime = max(floatval($obsel['date']), $lastKnownTime);
			$lastKnownId = max(floatval($obsel['id']), $lastKnownId);
		}
		
		if(count($obsels) == 0)
		{
			$this->atEot = true;
		}
		
		return $this->slice($obsels);
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		$trace = simplexml_load_file(DATA_DIR . '/' . $this->traceFilename);
		
		if($lastKnownId != "")
			$obsels = $trace->xpath('/sequence/obsel[number(@id) > '. $lastKnownId . ']');
		else
			$obsels = $trace->xpath('/sequence/obsel');
		
		$lastObsel = $trace->xpath('/sequence/obsel[math:max(/sequence/obsel@id)]');
		
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