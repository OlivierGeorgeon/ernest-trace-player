<?php
require_once 'include/ViewInfos.inc.php';

interface TraceHandler {

	public function getObsel($obselId);
	public function getObsels($timestampBegin, $timestampEnd);
	public function getNextObsels(&$lastKnownId, &$lastKnownTime);
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime);
	public function eot();
}

?>