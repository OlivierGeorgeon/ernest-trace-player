<?php
require_once 'include/ViewInfos.inc.php';
require_once 'include/TraceHandler.inc.php';
require_once 'include/XMLStreamTraceHandler.inc.php';

class XMLStreamComposerHandler implements TraceHandler
{
	public function __construct($traceHandlers)
	{
		$this->handlers =  $traceHandlers;
		$this->toAbort = false;
		$this->debugid = uniqid();
		$this->it = 0;
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
		file_put_contents("/tmp/toto" , $this->it++);
		
		if(!$this->slices or ($sliceNode = next($this->slices)) === false)
		{
			//pushError('No slice ready');
			if($this->toAbort)
				return array(false, false);
			
			$data = false;
			while($data === false)
			{
				if($this->aborted())
					return array(false, false);
				
				reset($this->handlers);
				while($handler =& current($this->handlers)
				      and $data === false)
				{
					//pushError('Opening ' . $handler->traceId);
					if(!$handler->openFile())
					{
						$this->atEot = true;
						return array(false, false);
					}
					
					//pushError('Reading... ');
					if(($data = $handler->tryRead()) !== false)
					{
						$data .= $handler->readAndFlush();
						$handler->computeSlices($data);
						$this->slices =& $handler->slices;
						$this->handler = $handler;
						
						//pushError('OK');
					}else{
						//pushError('not');
					}
					
					next($this->handlers);
				}
				if($data === false)
				{
					usleep(100000);
					//pushError('o');
				}else{
					$sliceNode = current($this->slices);
				}
			}
		}
		
		if($sliceNode->getName() == "eot")
		{
			$this->atEot = true;
			unlink($this->handler->filename);
			return array($this->handler->traceId, false);
		}
		$slice = $sliceNode->asXML();
		
		return array($this->handler->traceId, $slice);
	}
	
	public function getNextObselsNB(&$lastKnownId, &$lastKnownTime)
	{
		pushError("Unimplemented");
		die('</feed>');
	}
	
	public function eot()
	{
		return $this->atEot;
	}
	
	public function abortASAP()
	{
		$this->toAbort = true;
	}
	
	public function aborted()
	{
		echo "\n"; flush();
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