<?php
require_once 'include/stream.inc.php';
require_once 'include/TraceHandler.inc.php';
require_once 'include/Trace.inc.php';

/*
 * A hybrid trace handler that reads from database and stream.
 * It begins by reading the obsels from the database and continues by waiting 
 * for and reading obsels from the stream.
 * DBAndSocketHandler handles multiple traces, specified with DBAndSocketHandler::addTrace().
 */
class DBAndSocketHandler implements TraceHandler
{
	public function __construct()
	{
		$this->atEot = false;
		$this->traces = array();
		$this->oldDataTraces = array();
		$this->servers = array();
		$this->toAbort = false;
	}
	
	/*
	 * Adds a trace to read from.
	 * $trace : a Trace object.
	 */
	public function addTrace(&$trace)
	{
		$this->traces[] = &$trace;
		$this->oldDataTraces[] = &$trace;
		$this->servers[] = $trace->getServer(); // & removed to fix the warning Only variables should be assigned by reference
	}

	/*
	 * Read one obsel from one trace. Blocks indefinitly, until script 
	 * execution is aborted.
	 * Returns a two element array : (traceId, obselData).
	 * When the end of a stream is reached, returns (traceId, false).
	 * When the script is aborted, return (false, false).
	 */
	public function getNextObsels(&$lastKnownTime)
	{
		// If there is data stored in the db, begin by reading it.
		$slice = false;
		reset($this->oldDataTraces);
		while(!$slice and list($key, $trace) = each($this->oldDataTraces))
		{
			if($trace->hasNextStoredObsel())
			{
				$slice = $trace->getNextStoredObsel($lastKnownTime);
			}else{
				unset($this->oldDataTraces[key($this->oldDataTraces)]);
			}
		}
		
		//If nothing more on db,
		if(!$slice)
		{
			// Wait for an obsel on a stream (server)
			do {
				list($server, $slice) = streamGetObsel($this->servers, 3);
				
				if(! $server and ($this->toAbort or $this->aborted()))
				{
					return array(false, false);
				}
			} while(! $server);
			
			// To which trace belongs this stream (server) ?
			list($key, $trace) = each($this->traces);
			while($trace->getServer() != $server and $trace)
			{
				list($key, $trace) = each($this->traces);
			}
			reset($this->traces);
			
			if($trace->isTransient())
				$trace->clearStored();
		}
		
		// If a handler is at the end of its trace, remove it from the
		// list to read and return to the user to enable him to detect
		// the end of trace.
		$xml_data = simplexml_load_string($slice);
		if($xml_data->getName() == "eot")
		{
			$trace->setAtEot();
			
			if(isset($this->oldDataTraces[$key]))
				unset($this->oldDataTraces[$key]);
			unset($this->traces[$key]);
			unset($this->servers[$key]);
			
			return array($trace, false);
		}
		
		return array($trace, $slice);
	}
	
	public function getNextObselsNB(&$lastKnownTime)
	{
		pushError("Unimplemented : DBAndSockHandler::getNextObselsNB()");
		return $slice;
	}
	
	/*
	 * Returns false.
	 */
	public function eot()
	{
		return $this->atEot;
	}
	
	/*
	 * Shouldn't be used.
	 */
	public function setAtEot($eot)
	{
		$this->atEot = $eot;
	}
	
	/*
	 * Tells the handler the execution should be aborted soon. Used to make
	 * sure the stream is cut at a good time so no data is lost. 
	 */
	public function abortASAP()
	{
		$this->toAbort = true;
	}
	
	/*
	 * Tests wether the script has been aborted (browser closed, connection lost, etc.).
	 */
	protected function aborted()
	{
		echo "\n"; flush(); // Necessary for some reason to update connection status...
		if(connection_aborted() or connection_status() != 0)
		{
			return true;
		}else{
			return false;
		}
	}
	
	private $atEot;
	private $traceId;
	private $storedTrace;
	private $deleteAfterUse;
}

?>