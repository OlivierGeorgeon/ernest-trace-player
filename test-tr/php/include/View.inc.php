<?php
require_once 'include/ViewInfos.inc.php';

/**
 * A View defines a transformation from a trace or single obsels into displayable SVG elements.
 */
class View {

	public function __construct($infos) {
		$this->infos = $infos;
		$this->xsltProc = null;
		$this->xmlDoc = new DOMDocument;
	}

	/**
	 * Transforms some obsels into SVG Elements. They are treated like they are independant.
	 * $oe : a string containing the XML for one obsel.
	 */
	public function transformSingles($oe)
	{
		$this->xmlDoc->loadXML($oe);
		return $this->getObselProc()->transformToXml($this->xmlDoc);
	}

	/**
	 * Transforms a slice of contiguous obsels into an SVG Element.
	 * $slice : a string containing the XML for a slice of a trace.
	 */
	public function transformeSlice($slice, $begin, $end, $scale)
	{
		$xsl = $this->getSliceProc();
		$parameters = array (
				'begin' => $begin,
				'end'	=> $end,
				'scale'	=> $scale
		);
		$xsl->setParameter('', $parameters);

		$this->xmlDoc->loadXML($slice);
		return $xsl->transformToXml($this->xmlDoc);
	}

	/**
	 * Returns the ViewInfo object given at the construction of the View.
	 */
	public function getInfos()
	{
		return $this->infos;
	}

	protected function getObselProc()
	{
		if($this->xsltObselProc == null)
		{
			$this->xsltObselProc = new XSLTProcessor();
				
			$doc = new DOMDocument;
			$doc->load($this->infos->getXsltObselToSVG());
				
			$this->xsltObselProc->importStylesheet($doc);
		}

		return $this->xsltObselProc;
	}

	protected function getSliceProc()
	{
		if($this->xsltSliceProc == null)
		{
			$this->xsltSliceProc = new XSLTProcessor();
				
			$doc = new DOMDocument;
			$doc->load($this->infos->getXsltSliceToSVG());
				
			$this->xsltSliceProc->importStylesheet($doc);
		}

		return $this->xsltSliceProc;
	}

	protected $infos;

	protected $xsltObselProc;

	protected $xsltSliceProc;

	protected $xmlDoc;
}

?>