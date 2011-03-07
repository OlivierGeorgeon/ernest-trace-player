<?php 
require_once 'include/config.inc.php';

/**
 * Defines view constant informations (filenames). 
 */
class ViewInfos {

	public function __construct() {

	}

	/**
	 * Loads view informations from a XML file.
	 */
	public function loadFromFile($viewId)
	{
		if(! file_exists(VIEW_DATA_DIR . '/' . $viewId . '.xml'))
			die('This view (' . VIEW_DATA_DIR . '/' . $viewId . '.xml' . ')doesn \'t exists');
		
		$complete_filename = VIEW_DATA_DIR . '/' . $viewId . '.xml';
		
		$this->setId($viewId);
		
		if(! $XMLViewDoc = simplexml_load_file($complete_filename))
			return false;
	
		$this->setXsltSliceToSVG($XMLViewDoc->{'slice-transformation-filename'});
		$this->setXsltObselToSVG($XMLViewDoc->{'obsel-transformation-filename'});
		$this->setDefaultScale($XMLViewDoc->{'default-scale'});
		
		$this->setCssFileName($XMLViewDoc->{'css-filename'});

		return true;
	}

	/**
	 * Writes view informations into a XML file, replacing or creating it if necessary.
	 */
	public function saveToFile()
	{
		$XMLViewDoc= new XMLWriter();
		$XMLViewDoc->openURI('file://' . VIEW_DATA_DIR . '/' . $this->id . '.xml');
		
		$XMLViewDoc->setIndent(true);
		$XMLViewDoc->setIndentString('    ');
		
		$XMLViewDoc->startDocument();
		$XMLViewDoc->startElement("view");
		
		$XMLViewDoc->writeElement("slice-transformation-filename", $this->getXsltSliceToSVG());
		
		$XMLViewDoc->writeElement("obsel-transformation-filename", $this->getXsltObselToSVG());
		
		$XMLViewDoc->writeElement("default-scale", $this->getDefaultScale());
		
		$XMLViewDoc->writeElement("css-filename", $this->getCssFileName());
		
		$XMLViewDoc->endElement();
	}
	
	/**
	 * Outputs the view info file (XML) thru standard output.
	 */
	public function passViewInfosXMLFile()
	{
		if(file_exists(VIEW_DATA_DIR . '/' . $this->id . '.xml'))
			readfile(VIEW_DATA_DIR . '/' . $this->id . '.xml');
	}
	
	public function getId() { return $this->id; }
	
	/*
	 * View Id.
	 */
	public function setId($newId)
	{
		$this->id = $newId;
	}
	
	/*
	 * XSLT transformation used to process a trace slice into an SVG <g> element.
	 */
	public function getXsltSliceToSVG()
	{
		return VIEW_DATA_DIR . '/xslt/' . $this->xsltSliceToSVG . '.xsl';
	}
	
	public function setXsltSliceToSVG($xsltSliceToSVG)
	{
		$this->xsltSliceToSVG = $xsltSliceToSVG;
	}
	
	/*
	 * XSLT transformation used to process a single obsel into an SVG element.
	 */
	public function getXsltObselToSVG()
	{
		return VIEW_DATA_DIR . '/xslt/' . $this->xsltObselToSVG . '.xsl';
	}
	
	public function setXsltObselToSVG($xsltObselToSVG)
	{
		$this->xsltObselToSVG = $xsltObselToSVG;
	}
	
	/*
	 * The default scale at which the trace should be displayed.
	 */
	public function getDefaultScale()
	{
		return $this->defaultScale;
	}
	
	public function setDefaultScale($defaultScale)
	{
		$this->defaultScale= $defaultScale;
	}
	
	/*
	 * The css to use when displaying the view.
	 */
	public function getCssFileName()
	{
		return VIEW_DATA_DIR . '/css/' . $this->cssFileName . '.css';
	}
	
	public function setCssFileName($cssFileName)
	{
		$this->cssFileName = $cssFileName;
	}
	
	/**
	 * View Id.
	 */
	protected $id;
	
	/**
	 * XSLT transformation used to process a trace slice into an SVG <g> element.
	 */
	protected $xsltSliceToSVG;
	
	/**
	 * XSLT transformation used to process a single obsel into an SVG element.
	 */
	protected $xsltObselToSVG;
	
	/**
	 * The default scale at which the trace should be displayed.
	 */
	protected $defaultScale;
	
	/**
	 * The css to use when displaying the view.
	 */
	protected $cssFileName;
};



?>