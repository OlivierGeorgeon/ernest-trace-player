<?php

/*
 * ca sert plus a rien ca...
 */
interface TraceHandler {
	public function getNextObsels(&$lastKnownTime);
	public function getNextObselsNB(&$lastKnownTime);
	public function eot();
}

?>