<?php

require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';

include_once('include/lib/arc/ARC2.php');

/*set_include_path('./include/lib/');
require_once "EasyRdf.php";
require_once "EasyRdf/Parser/Arc.php";*/

class KTBSTraceHandler implements TraceHandler
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
		die("Unimplementable");
	}
	
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
				$value = $prop_value[0];
				
				$XMLObsels->writeElement($name, $value);
			}
		}
		
		$XMLObsels->endElement();
	}
	
	public function getNextObsels(&$lastKnownId, &$lastKnownTime)
	{
		$XMLObsels = new XMLWriter();
		$XMLObsels->openMemory();
		
		$XMLObsels->setIndent(true);
		$XMLObsels->setIndentString('    ');
		
		$XMLObsels->startDocument();
		$XMLObsels->startElement("slice");
		
		$nbObsels = 0;
		
		//KTBS seems to have problems handling negative time
		if(intval($lastKnownTime) < 0)
		{
			$lastKnownTime = 0;
		}
		$newLastKnownTime = $lastKnownTime;
		$newLastKnownId = $lastKnownId;
		
		while($nbObsels == 0 and !connection_aborted())
		{
			if($lastKnownTime === "")
				$rqst = $this->traceURI . '@obsels.nt';
			else
				$rqst = $this->traceURI . '@obsels.nt?minb=' . $lastKnownTime;
			
			$parser = ARC2::getRDFParser();
			$parser->parse($rqst);
			$index = $parser->getSimpleIndex();
			
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
			
			if($nbObsels == 0)
			{
				usleep(250000);
			}
		}
		
		$XMLObsels->endElement();
		$XMLObsels->endDocument();
		
		$lastKnownTime = $newLastKnownTime;
		$lastKnownId = $newLastKnownId;
		
		return $XMLObsels->outputMemory();
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
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
		
		return $XMLObsels->outputMemory();
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