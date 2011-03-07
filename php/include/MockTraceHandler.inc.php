<?php 
require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';

class MockTraceHandler implements TraceHandler
{
	public function getObsels($timestampBegin, $timestampEnd)
	{
		$id = 1;
		$id2 = $id + 1;
		$id3 = $id + 1;
		$id4 = $id + 2;
		
		$date1 = $timestampBegin;
		$date2 = $timestampBegin + 5;
		$date3 = ($timestampBegin+$timestampEnd) / 2;
		$date4 = $timestampEnd-10;
		
		$garbage = rand(1, 10000);
		$garbage2 = rand(1, 10000);
		$garbage3 = rand(1, 10000);
		$garbage4 = rand(1, 10000);
		
		return "<slice>".
			"<obsel id=\"${timestampBegin}42$id\"><date>$date1</date>$garbage</obsel>".
			"<obsel id=\"${timestampBegin}42$id2\"><date>$date2</date>$garbage2</obsel>".
			"<obsel id=\"${timestampBegin}42$id3\"><date>$date3</date>$garbage3</obsel>".
			"<obsel id=\"${timestampBegin	}42$id4\"><date>$date4</date>$garbage4</obsel>".
			"</slice>"
		;
	}
	
	public function getObsel($obselId)
	{
		$garbage = rand(1, 10000);
		$newDate = $lastKnownTime + $obselId*5 + rand(0, 20)*0.1;
		return "<obsel id=\"$obselId\"><date>$newDate</date>$garbage</obsel>";
	}
	
	public function getNextObsels(&$lastKnownId, &$lastKnownTime)
	{
		usleep(150000);
		
		$garbage = rand(1, 10000);
		$newId = intval($lastKnownId) + 1;
		$newDate = $lastKnownTime + $newId*5 + rand(0, 20)*0.1;
		return "<slice><obsel id=\"$newId\"><date>$newDate</date>$garbage</obsel></slice>";
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		return null;
	}
	
	public function eot()
	{
		return false;
	}
}


?>