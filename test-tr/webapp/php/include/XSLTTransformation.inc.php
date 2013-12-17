<?php
require_once('include/Transformation.inc.php');

/*
 * Represents a transformation using an XSLT stylesheet. 
 */
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
			
			//$this->xsltProc->setSecurityPrefs(0); // Olivier Georgeon for PHP5.4
				
			$doc = new DOMDocument;
			$doc->load($this->xsltFilename);
				
			$this->xsltProc->importStylesheet($doc);
		}

		return $this->xsltProc;
	}

	protected function forceSaveStateImpl() {}

	protected $xsltProc;
	protected $xsltFilename;
};

?>