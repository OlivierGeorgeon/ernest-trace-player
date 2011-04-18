<?php
require_once('include/Transformation.inc.php');

abstract class PHPTransformation extends Transformation
{
	/*
	 * $name : name of the transformations
	 * $stateFilename : name of the file which the transformation should write its state in
	 */
	public function __construct($name, $stateFilename)
	{
		parent::__construct($name, $stateFilename);
		$this->loadState();
	}
	
	public function forceSaveState()
	{
		$this->state->save($this->stateFilename);
	}
	
	protected function loadState()
	{
		$this->state = new DOMDocument;
		$this->state->load($this->stateFilename);
	}
	
	public function transform($deltas)
	{
		$res = $this->doTransform($deltas);
		pushError("XML(".$this->name.")" . $res->saveXML() . "/XML");
		return $res;
	}
	
	protected $xsltProc;
	protected $xsltFilename;
	protected $state;
};