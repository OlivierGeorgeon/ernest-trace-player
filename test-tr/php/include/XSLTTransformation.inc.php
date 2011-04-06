<?php
require_once('include/Transformation.inc.php');

class XSLTTransformation extends Transformation
{
	/*
	 * $name : name of the transformations
	 * $stateFilename : name of the file which the transformation should write its state in
	 * $xsltFilename : complete filename of the xslt file
	 */
	public function __construct($name, $stateFilename, $xsltFilename)
	{
		parent::__construct($name, $stateFilename);
		$this->xsltFilename = $xsltFilename;
		touch($this->stateFilename);
	}
	
	public function transform($deltas)
	{
		$xsl = $this->getProc();
		$parameters = array (
			'name' => $this->name,
			'state-filename' => $this->stateFilename
		);
		$xsl->setParameter('', $parameters);
		
		return $xsl->transformToDoc($deltas);
	}
	
	protected function getProc()
	{
		if($this->xsltProc == null)
		{
			$this->xsltProc = new XSLTProcessor();
			
			$doc = new DOMDocument;
			$doc->load($this->xsltFilename);
			
			$this->xsltProc->importStylesheet($doc);
		}
		
		return $this->xsltProc;
	}
	
	public function forceSaveState() {}
	
	protected $xsltProc;
	protected $xsltFilename;
};