<?php
require_once 'include/config.inc.php';

abstract class Transformation {
	public function __construct($name, $stateFilename)
	{
		$this->name = $name;
		$this->stateFilename = $stateFilename;
		
		if(! file_exists($this->stateFilename))
		{
			$out = new XMLWriter();
			$out->openURI('file://' . $this->stateFilename);
			$out->startDocument();
			$out->writeElement('nothing');
			$out->endDocument();
			$out->flush();
		}
		
		register_shutdown_function(
			function($args){
				$args[0]->forceSaveState();
		}, array($this));
	}
	
	public function __destruct()
	{
		$this->forceSaveState();
	}
	
	/*
	 * $deltas : xml string of the form <deltas> <delta source="...">...</delta> ... </deltas>
	 */
	abstract public function transform($deltas);
	
	/*
	 * Called when the php script is going to be shut down.
	 */
	abstract public function forceSaveState();
	
	/*
	 * Cleans the saved state informations.
	 */
	public function cleanState()
	{
		unlink($this->stateFilename);
	}
	
	protected $name;
	protected $stateFilename;
}

?>