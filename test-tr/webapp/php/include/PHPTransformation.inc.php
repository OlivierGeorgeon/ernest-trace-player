<?php
require_once('include/Transformation.inc.php');
require_once('include/misc.inc.php');

/*
 * A helper to implement php transformations. 
 */
abstract class PHPTransformation extends Transformation
{
	/*
	 * $name : name of the transformations
	 * $stateFilename : name of the file which the transformation should write its state in
	 */
	public function __construct($name, $stateFilename)
	{
		parent::__construct($name, $stateFilename);
	}

	public function transform($deltas)
	{
		$cwd = getcwd();
		chdir(DATA_DIR . '/pipelines/transformations/');

		$my_doc = new DOMDocument();
		$my_deltas = $my_doc->createElement("deltas");
		$my_doc->appendChild($my_deltas);

		$deltas = simplexml_import_dom($deltas);
		$delta = $deltas->xpath("/deltas/delta");

		$tempDeltas = '<deltas>';

		$last_date = null;
		foreach($delta as &$one_delta)
		{
			if($last_date === null or $last_date == intval($one_delta['date']))
			{
				$tempDeltas .= $one_delta->asXML();
			}else{
				$tempDeltas .= '</deltas>';
				$this->transform_many_obsels(simplexml_load_string($tempDeltas), $last_date, $my_doc, $my_deltas);

				$tempDeltas = '<deltas>';
				$tempDeltas .= $one_delta->asXML();
			}
			$last_date = intval($one_delta['date']);
		}

		if($last_date !== null)
		{
			$tempDeltas .= '</deltas>';
			$this->transform_many_obsels(simplexml_load_string($tempDeltas), $last_date, $my_doc, $my_deltas);
		}

		chdir($cwd);
		return $my_doc;
	}

	protected function transform_many_obsels($merged_deltas, $date, &$doc, &$deltasElement)
	{
		$deltaElement = $doc->createElement("delta");
		$deltaElement->setAttribute("source", $this->name);
		$deltaElement->setAttribute("date", $date);
		$deltasElement->appendChild($deltaElement);

		$obsels = $merged_deltas->xpath("/deltas/delta/*");
		foreach($obsels as $obsel)
		{
			$this->transform_one_obsel($obsel, $deltaElement, $doc);
		}
	}

	protected function forceSaveStateImpl()
	{
		file_put_contents($this->stateFilename, $this->state->saveXML());
	}

	protected function loadState()
	{
		parent::loadState();
		$this->state = simplexml_load_file($this->stateFilename);
	}

	/*
	 * Should transform one obsel.
	 * $obsel : the obsel data (a SimpleXMLElement).
	 * &$delta : the element to which append results (a DOMElement).
	 * &$doc : the document to which belongs &$delta.
	 */
	abstract protected function transform_one_obsel($obsel, &$delta, &$doc);

	protected $xsltProc;
	protected $xsltFilename;
	protected $state;
};