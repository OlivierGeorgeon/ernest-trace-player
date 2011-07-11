<?php
require_once 'include/stream.inc.php';

/*
 * Manages a trace. Handles the retreivial of stored obsels from the database,
 * and the stream server construction.
 */
class Trace
{
	/*
	 * Construct a trace and retreives stored obsels from db that are older than
	 * $lastKnownTime. Deletes these obsels from db if $deleteAfterUse is set 
	 * to true.
	 * $traceId : The trace identifier.
	 * $lastKnownTime : time of the last known obsel.
	 * $deleteAfterUse : tells if the obsels should be deleted after read.
	 */
	public function __construct($traceId, $lastKnownTime = false, $deleteAfterUse = false)
	{
		$this->traceId = $traceId;
		$this->deleteAfterUse = $deleteAfterUse;
		$this->startTime = $lastKnownTime;
		
		$this->server = streamOpen($traceId);
		
		if($lastKnownTime != false)
			$this->storedTrace = dbGetObsels($this->traceId, $lastKnownTime, $deleteAfterUse);
		else
			$this->storedTrace = dbGetAllObsels($this->traceId, $deleteAfterUse);

		$this->res = current($this->storedTrace);
	}
	
	/*
	 * Gets one stored trace obsel.
	 * $lastKnownTime : no purpose.
	 */
	public function getNextStoredObsel(&$lastKnownTime)
	{
		$lastKnownTime = $this->res['o_date'];
		$slice = $this->res['o_data'];
		
		$this->res = next($this->storedTrace);
		
		return $slice;
	}
	
	/*
	 * Returns true if tere is more stored obsels to read.
	 */
	public function hasNextStoredObsel()
	{
		return $this->res;
	}
	
	/*
	 * Returns true if the trace has reached its end (and we have read it all).
	 */
	public function eot()
	{
		return $this->atEot;
	}
	
	/*
	 * Informs the trace it hase reached its end.
	 */
	public function setAtEot()
	{
		$this->atEot = true;
		pushError("Shutting down stream server '$this->traceId'");
		streamClose($this->server, $this->traceId);
	}
	
	/*
	 * Get this trace's stream server.
	 */
	public function getServer()
	{
		return $this->server;
	}
	
	public function getId()
	{
		return $this->traceId;
	}
	
	/*
	 * Returns true if the stored data should be deleted after read.
	 */
	public function isTransient()
	{
		return $this->deleteAfterUse;
	}
	
	/*
	 * Delete stored obsels.
	 */
	public function clearStored()
	{
		if($this->deleteAfterUse)
		{
			deleteStored($this->traceId);
		}
	}
	
	private $res;
	private $storedTrace;
	private $traceId;
	private $startTime;
	private $deleteAfterUse;
	private $server;
	private $atEot;
}

?>