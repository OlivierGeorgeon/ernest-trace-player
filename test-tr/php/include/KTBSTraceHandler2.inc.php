<?php

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';

include_once('include/lib/arc/ARC2.php');


class KTBSTraceHandler2 implements TraceHandler
{
	public function __construct($traceURI, $traceModel)
	{
		$this->traceURI = $traceURI;
		$this->ktbsns = 'http://liris.cnrs.fr/silex/2009/ktbs#';
		$this->rdfns = 'http://www.w3.org/1999/02/22-rdf-syntax-ns#';
		$this->treacens = $this->traceURI;
		$this->modelns = $traceModel;
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		//KTBS has problems with negative numbers
		if(intval($timestampBegin) < 0)
		{
			$timestampBegin = 0;
		}
		
		if(intval($timestampEnd) < 0)
		{
			$timestampEnd = 0;
		}
		
		$rqst = $this->traceURI . '@obsels.nt?minb=' . $timestampBegin . '&maxe=' . $timestampEnd;

		$parser = ARC2::getRDFParser();
		$parser->parse($rqst);
		$index = $parser->getSimpleIndex();
		
		$XMLObsels = new XMLWriter();
		$XMLObsels->openMemory();
		$XMLObsels->setIndent(true);
		$XMLObsels->setIndentString('    ');
		
		$XMLObsels->startDocument();
		$XMLObsels->startElement("slice");
		
		foreach($index as $ktbsId => $properties)
		{
			$this->parseObsel($ktbsId, $properties, $XMLObsels);
		}
		
		$XMLObsels->endElement();
		$XMLObsels->endDocument();
		
		//echo $XMLObsels->outputMemory();
		return $XMLObsels->outputMemory();
	}
	
	public function getObsel($obselId)
	{
		die("<error>Unimplementable</error>");
	}
	/*
	private function parseObsel(&$ktbsId, &$properties, &$XMLObsels)
	{
		$XMLObsels->startElement("obsel");
		
		$begin = $properties[$this->ktbsns . 'hasBegin'][0];
		$end = $properties[$this->ktbsns . 'hasEnd'][0];
		
		$id = $properties[$this->modelns . 'id'][0];
		
		$type = $properties[$this->rdfns . 'type'][0];
		$type = substr($type, strlen($this->modelns));
		
		$XMLObsels->writeAttribute("id", $id);
		
		$XMLObsels->startElement("ktbs-data");
			$XMLObsels->writeElement("ktbsId", $ktbsId);
			$XMLObsels->writeElement("ktbsBegin", $begin);
			$XMLObsels->writeElement("ktbsEnd", $end);
		$XMLObsels->endElement();
		
		$XMLObsels->writeElement("date", $begin);
		$XMLObsels->writeElement("type", $type);
		
		foreach($properties as $prop_name => $prop_value)
		{
			if(strpos($prop_name, $this->modelns) === 0)
			{
				$name = substr($prop_name, strlen($this->modelns));
				//TODO: recurse if $prop_value[0] is an array
				$value = $prop_value[0];
				
				$XMLObsels->writeElement($name, $value);
			}
		}
		
		$XMLObsels->endElement();
	}
	*/
	protected function indexCompare($a, $b)
	{
		if(intval($a[$this->ktbsns . 'hasBegin'][0]) < intval($b[$this->ktbsns . 'hasBegin'][0]))
		{
			return -1;
		}else if(intval($a[$this->ktbsns . 'hasBegin'][0]) > intval($b[$this->ktbsns . 'hasBegin'][0]))
		{
			return 1;
		}else{
			return 0;
		}
	}
	
	protected function loadIndexFromKTBS($lastKnownTime)
	{
		$parser = ARC2::getTurtleParser();
		
		if($lastKnownTime === "")
		{
			$parser->parse($this->traceURI . "@about.nt");
			$index = $parser->getSimpleIndex();
			$origin = $index[$this->traceURI][$this->ktbsns . 'hasOrigin'][0];
			
			$rqst = $this->traceURI . '@obsels.nt?minb=' . $origin;
		}else
			$rqst = $this->traceURI . '@obsels.nt?aminb=' . $lastKnownTime;// . "&forcecache=" . rand();
		
		$parser->parse($rqst);
		//echo $rqst . " \n" . implode("\n", $parser->getErrors()) . "\n\n"; flush();
		
		$this->index = $parser->getSimpleIndex();
	}
	
	public function getNextObsels(&$lastKnownTime, &$null)
	{
		$XMLObsels = new XMLWriter();
		$XMLObsels->openMemory();
		
		$XMLObsels->setIndent(true);
		$XMLObsels->setIndentString('    ');
		
		$XMLObsels->startDocument();
		$XMLObsels->startElement("slice");
		
		//KTBS seems to have problems handling negative time
		if(intval($lastKnownTime) < 0)
		{
			$lastKnownTime = 0;
		}
		
		$newLastKnownTime = $lastKnownTime;
		
		/*
		 * Load obsels if necessary.
		 */
		while(! (isset($this->index) && is_array($this->index) && current($this->index) !== false))
		{
			$this->loadIndexFromKTBS($lastKnownTime);
			
			//echo var_dump($this->index);
			//echo "\n====================\n" . $lastKnownTime . "\n====================\n";flush();
			
			if(isset($this->index) && is_array($this->index))
			{
				/*
				 * Sort the obsels wrt their dates, and passe them which dates equals the last known date.
				 */
				uasort($this->index , array($this, "indexCompare"));
				$obsel = current($this->index);
				while($lastKnownTime != "" && $obsel !== false && intval($obsel[$this->ktbsns . 'hasBegin'][0]) == intval($lastKnownTime))
				{
					next($this->index);
					$obsel = current($this->index);
				}
			}
			
			if(! (isset($this->index) && is_array($this->index) && current($this->index)))
				usleep(500000);
			
			echo "\n"; flush();
			if(connection_aborted() or connection_status() != 0)
			{
				return false;
			}
		}
		
		
		/*
		 * Process the first obsels (smaller dates) of equal dates.
		 */
		if($obsel = current($this->index))
		{
		    do{
				$ktbsId = key($this->index);
		    	next($this->index);
		    	
		    	$newLastKnownTime = max(intval($obsel[$this->ktbsns . 'hasBegin'][0]), $newLastKnownTime);
				//$this->parseObsel($ktbsId, $obsel, $XMLObsels);
				$XMLObsels->writeRaw($obsel[$this->modelns . 'hasXMLValue'][0]);
				//xmlwriter_write_raw($XMLObsels, $obsel[$this->ktbsns . 'hasXMLValue'][0]);
				
				$oldate = intval($obsel[$this->ktbsns . 'hasBegin'][0]);
				$obsel = current($this->index);
		    }while($obsel !== false && intval($obsel[$this->ktbsns . 'hasBegin'][0]) == $oldate);
		}
		
		
		$XMLObsels->endElement();
		$XMLObsels->endDocument();
		
		$lastKnownTime = $newLastKnownTime;
		
		return $XMLObsels->outputMemory();
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		die("<error>TODO</error>");
		$XMLObsels = new XMLWriter();
		$XMLObsels->openMemory();
		
		$newLastKnownTime = $lastKnownTime;
		$newLastKnownId = $lastKnownId;
		
		$XMLObsels->flush();
		
		//KTBS has problems with negative numbers
		if(intval($lastKnownTime) < 0)
		{
			$lastKnownTime = 0;
		}
		
		if($lastKnownTime === "")
			$rqst = $this->traceURI . '@obsels.nt';
		else
			$rqst = $this->traceURI . '@obsels.nt?minb=' . $lastKnownTime;
		
		$parser = ARC2::getRDFParser();
		$parser->parse($rqst);
		$index = $parser->getSimpleIndex();
		
		$XMLObsels->setIndent(true);
		$XMLObsels->setIndentString('    ');
		
		$XMLObsels->startDocument();
		$XMLObsels->startElement("slice");
		
		foreach($index as $ktbsId => $properties)
		{
			// Filter the simultaneous events which are anterior id wise
			if($lastKnownTime === "" or $properties[$this->modelns . 'id'][0] > $lastKnownId)
			{
				$newLastKnownId = max($properties[$this->modelns . 'id'][0], $newLastKnownId);
				$newLastKnownTime = max($properties[$this->ktbsns . 'hasBegin'][0], $newLastKnownTime);
				$nbObsels++;
				$this->parseObsel($ktbsId, $properties, $XMLObsels);
			}
		}
		
		$XMLObsels->endElement();
		$XMLObsels->endDocument();
		
		$lastKnownTime = $newLastKnownTime;
		$lastKnownId = $newLastKnownId;
		
		$om = $XMLObsels->outputMemory();
		return $om;
	}
	
	public function eot()
	{
		return false;
	}
	
	private $traceURI;
	private $ktbsns;
	private $treacens;
	private $modelns;
}


?>