<?php
require_once 'include/config.inc.php';
require_once 'include/PipelineInfos.inc.php';
require_once 'include/XSLTTransformation.inc.php';
require_once 'include/PHPTransformation.inc.php';

class Pipeline
{
	public function __construct($infos, $cleanup)
	{
		$this->infos = $infos;

		$this->transformations = array();
		if($cleanup)
		$this->cleanStates();

		$this->instanciateTransformations();
		$this->deltas_minus_1 = new DOMDocument();
		$this->deltas_doc = new DOMDocument();
	}

	public function transform($obsels, $source = "Ernest")
	{
		$baseSourceName = ($source == "__config__") ? "__config__" : "__input__";

		$deltas_minus_1 =& $this->deltas_minus_1;
		$deltas_doc =& $this->deltas_doc;
		$deltas_element =& $this->deltas_element;

		if(isset($this->deltas_element))
		$deltas_doc->removeChild($deltas_element);

		$deltas = array();
		//Initializing the input of the pipeline with the obsels to transform
		$deltas['__input__'] = new DOMDocument();
		$ds = $deltas['__input__']->createElement("deltas");
		$deltas['__input__']->appendChild($ds);
		$d['__input__'] = $deltas['__input__']->createElement("delta");
		$d['__input__']->setAttribute("source", '__input__');
		$d['__input__']->setAttribute("date", $obsels->documentElement->getAttribute('date'));
		$ds->appendChild($d['__input__']);

		$deltas['__config__'] = new DOMDocument();
		$ds = $deltas['__config__']->createElement("deltas");
		$deltas['__config__']->appendChild($ds);
		$d['__config__'] = $deltas['__config__']->createElement("delta");
		$d['__config__']->setAttribute("source", '__config__');
		$d['__config__']->setAttribute("date", $obsels->documentElement->getAttribute('date'));
		$ds->appendChild($d['__config__']);

		foreach($obsels->childNodes as $obsel)
		{
			$d[$baseSourceName]->appendChild($deltas[$baseSourceName]->importNode($obsel, true));
		}

		//Pass each level of transformation
		foreach($this->infos->levels as $level)
		{
			//Do each transformation in this level
			foreach($level as $name => $transInfo)
			{
				//Aggregate input deltas for the transformation
				$delta_element = $deltas_minus_1->createElement('deltas');
				$deltas_minus_1->appendChild($delta_element);

				foreach($transInfo['sources'] as $sourceName)
				{
					if($deltas[$sourceName]->documentElement === null)
					{
						pushError("No output for transformation " . $sourceName . ".");
					}
						
					foreach($deltas[$sourceName]->documentElement->childNodes as $delta)
					{
						$delta_element->appendChild(
						$deltas_minus_1->importNode(
						$delta, true));
					}
				}

				//Do the transformation
				$deltas[$name] = $this->transformations[$name]->transform($deltas_minus_1);

				//Clean aggregated deltas
				$deltas_minus_1->removeChild($delta_element);
			}
		}

		$deltas_element = $deltas_doc->createElement('deltas');
		$deltas_doc->appendChild($deltas_element);
		foreach($this->infos->output as $outputSourceName)
		{
			if($deltas[$outputSourceName]->documentElement === null)
			{
				pushError("No output for transformation " . $outputSourceName . ".");
			}
				
			foreach($deltas[$outputSourceName]->documentElement->childNodes as $delta)
			{
				$deltas_element->appendChild(
				$deltas_doc->importNode(
				$delta, true));
			}
		}

		return $deltas_doc;
	}

	public function cleanStates()
	{
		foreach($this->transformations as $transformation)
		{
			$transformation->cleanState();
		}

		foreach(glob(TEMP_DATA_DIR . '/states/*') as $tempFile)
		{
			unlink($tempFile);
		}

		touch(TEMP_DATA_DIR . '/streams/__config__');
	}

	protected function instanciateTransformations()
	{
		foreach($this->infos->levels as $level)
		{
			foreach($level as $name => $transInfo)
			{
				if($transInfo['type'] == 'XSLT')
				{
					// TODO : the temp state file name should depend on the session !!!
					$this->transformations[$name] = new XSLTTransformation(
					$name,
					TEMP_DATA_DIR . '/states/' . $name . '-state.xml',
					$transInfo['file']);
				}elseif($transInfo['type'] == 'PHP')
				{
					include_once($transInfo['file']);
					$this->transformations[$name] = new $transInfo["classname"](
					$name,
					TEMP_DATA_DIR . '/states/' . $name . '-state.xml');
						
						
				}
			}
		}
	}

	protected $infos;
	protected $transformations;
	protected $deltas_minus_1;
	protected $deltas_doc;
	protected $deltas_element;

}