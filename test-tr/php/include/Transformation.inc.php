<?php
require_once 'include/config.inc.php';

abstract class Transformation {
	public function __construct($name, $stateFilename)
	{
		$this->name = $name;
		$this->stateFilename = $stateFilename;
		$this->cleaned = false;
		$this->saved = false;

		$this->loadState();

		register_shutdown_function(
		function($args){
			$args[0]->forceSaveState();
		}, array($this));
	}

	public function __destruct()
	{
		$this->forceSaveState();
	}

	protected function loadState()
	{
		if(! file_exists($this->stateFilename))
		{
			$out = new XMLWriter();
			$out->openURI('file://' . $this->stateFilename);
			$out->startDocument();
			$out->writeElement('nothing');
			$out->endDocument();
			$out->flush();
		}
	}

	/*
	 * $deltas : xml string of the form <deltas> <delta source="...">...</delta> ... </deltas>
	 */
	abstract public function transform($deltas);

	/*
	 * Called when the php script is going to be shut down.
	 */
	public function forceSaveState()
	{
		if(!$this->saved)
		{
			$this->saved = true;
			if(! $this->cleaned)
			$this->forceSaveStateImpl();
		}
	}

	abstract protected function forceSaveStateImpl();

	/*
	 * Cleans the saved state informations.
	 */
	public function cleanState()
	{
		$this->cleaned = true;
		$this->cleanStateImpl();
	}

	protected function cleanStateImpl()
	{
		unlink($this->stateFilename);
	}

	private $cleaned;
	protected $name;
	protected $stateFilename;
	protected $saved;
}

?>