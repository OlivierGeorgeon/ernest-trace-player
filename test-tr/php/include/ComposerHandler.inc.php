<?php
require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';
require_once 'include/XMLStreamTraceHandler.inc.php';

class ComposerHandler implements TraceHandler
{
	public function __construct($traceHandlers)
	{
		$this->handlers =  $traceHandlers;
		$this->toAbort = false;
		$this->atEot = false;
	}

	public function getObsels($timestampBegin, $timestampEnd)
	{
		pushError("Unimplementable");
		die('</feed>');
	}
	
	public function getObsel($obselId)
	{
		pushError("Unimplementable");
		die('</feed>');
	}
	
	public function getNextObsels(&$null1, &$null2)
	{
		$nb = count($this->handlers);
		$i = 0;
		
		if(! current($this->handlers))
		{
			reset($this->handlers);
		}
		
		//Read from each handler, in turn.
		while(list($key, $handler) = each($this->handlers))
		{
			if($handler->eot() !== true)
			{
				// Get the next obsel, non blocking
				$slice = $handler->getNextObselsNB($null1, $null2);
				
				// If we got obsels, return them
				if($slice !== false)
				{
					return array($handler, $slice);
				}else{
					// If a handler is at the end of its trace, remove it from the
					// list to read and return to the user to enable him to detect
					// the end of trace.
					if($handler->eot() === true)
					{
						unset($this->handlers[$key]);
						reset($this->handlers);
						return array($handler, false);
					}
				}
			}else{
				// If a handler is at the end of its trace, remove it from the
				// list to read and return to the user to enable him to detect
				// the end of trace.
				unset($this->handlers[$key]);
				reset($this->handlers);
				return array($handler, false);
			}
			
			// If we couldn't get any obsel form any handler
			++$i;
			if($i >= $nb)
			{
				// If we're to abort, it means every handler has aborted,
				// so return false.
				if($this->toAbort or $this->aborted())
				{
					return array(false, false);
				}
				// Else, wait a little and try again
				$i = 0;
				usleep(100000);
			}
			
			if(! current($this->handlers))
			{
				reset($this->handlers);
			}
		}
		
		// All is finished
		$this->atEot = true;
		return array(false, false);
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		//TODO
		pushError("Unimplemented");
		die('</feed>');
	}
	
	public function eot()
	{
		return $this->atEot;
	}
	
	public function abortASAP()
	{
		foreach($this->handlers as $handler)
		{
			$handler->abortASAP();
		}
		
		$this->toAbort = true;
	}
	
	public function aborted()
	{
		echo "\n"; flush();
		touch("/tmp/tested-abort");
		if(connection_aborted() or connection_status() != 0)
		{
			return true;
		}else{
			return false;
		}
	}
	
	private $fd;
	private $doc;
	private $atEot;
	private $slices;
}

?>