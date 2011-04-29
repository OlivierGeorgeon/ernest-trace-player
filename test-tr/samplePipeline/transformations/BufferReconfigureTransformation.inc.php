<?php

class BufferReconfigureTransformation extends PHPTransformation
{
	public function transform_one_obsel($obsel, &$delta, &$doc)
	{
		if($obsel !== false)
		{
			if($obsel['source'] and $obsel['source'] == "__config__")
			{
				$this->loadTrace();
				if($obsel->type == "new-symbole")
				{
					// Append the new symbole to the symbole set.
					SimpleXMLElement_append($this->configState->symboles, $obsel->symbole);
					
					// Reprocess all the trace obsels for the new symbole.
					foreach($this->trace->children() as $trace_obsel)
					{
						$symboleElement = $this->symbolize($trace_obsel, $obsel->symbole, $delta, $doc);
						
						if($symboleElement !== false)
						{
							$obselElement = $doc->createElement('original-obsel');
							$obselElement->appendChild($doc->importNode(dom_import_simplexml($trace_obsel), true));
							$symboleElement->appendChild($obselElement);
						}
					}
					
				}elseif($obsel->type == "delete-symbole")
				{
					$id = $obsel['id'];
					$sid = $obsel['symbole-id'];
					
					// Find the symbole with the given id
					$symboles = $this->configState->symboles->xpath("symbole[@id='$sid']");
					foreach($symboles as $symbole)
					{
						// Find all symboles created by this symbole
						// TODO: do that differently, keeping track of the created obsels 
						//  (the condition might be nondeterministic)
						$xpathres = $this->trace->xpath("/slice/*[" . (string)$symbole->condition . "]");
						
						if($xpathres !== false and count($xpathres) != 0)
						{
							foreach($xpathres as $trace_obsel)
							{
								$symboleId = $trace_obsel['id'] . "-sym" . $sid;
								$deleteElement = $doc->createElement('delete');
								$deleteElement->setAttribute('obsel-id', $symboleId);
								$deleteElement->setAttribute('id', $id);
								$delta->appendChild($deleteElement);
							}
						}
						
						$sydom = dom_import_simplexml($symbole);
						$sydom->parentNode->removeChild($sydom);
					}
				}elseif($obsel->type == "new-long-symbole")
				{
					// Append the new symbole to the symbole set.
					SimpleXMLElement_append($this->configState->{'long-symboles'}, $obsel->lsymbole);
					
					// Reprocess all the trace obsels for the new symbole.
					// Reinitialize the dom doc used with the stylesheet
					$this->initLSData($this->getDataDoc());
					foreach($this->trace->children() as $trace_obsel)
					{
						$symboleElement = $this->longSymbolize($trace_obsel, $obsel->lsymbole, $delta, $doc);
						
						if($symboleElement !== false)
						{
							$obselElement = $doc->createElement('original-obsel');
							$obselElement->appendChild($doc->importNode(dom_import_simplexml($trace_obsel), true));
							$symboleElement->appendChild($obselElement);
						}
					}
					
					$this->initLSData($this->getDataDoc(), dom_import_simplexml($this->lastTraceObsel));
				}elseif($obsel->type == "delete-long-symbole")
				{
					$lsymboles = $this->lsState->xpath("/state/ls[@ls-id = '" . $obsel['symbole-id'] . "']");
					$del = array();
					foreach($lsymboles as $ls)
					{
						$deleteElement = $doc->createElement('ldelete');
						$deleteElement->setAttribute('obsel-id', $ls['id']);
						
						$delta->appendChild($deleteElement);
						
						$del[] = dom_import_simplexml($ls);
					}
					
					$lcurrent = $this->lsState->xpath("/state/current-ls[@ls-id = '" . $obsel['symbole-id'] . "']");
					if(count($lcurrent) > 0)
					{
						$ls = $lcurrent[0];
						$deleteElement = $doc->createElement('ldelete');
						$deleteElement->setAttribute('obsel-id', $ls['id']);
						
						$delta->appendChild($deleteElement);
						
						$del[] = dom_import_simplexml($ls);
					}
					
					foreach($del as $elt)
					{
						$elt->parentNode->removeChild($elt);
					}
					
					$lsymbole = $this->configState->{'long-symboles'}
						-> xpath("lsymbole[@id='" . $obsel['symbole-id'] . "']");
					$lsydom = dom_import_simplexml($lsymbole[0]);
					$lsydom->parentNode->removeChild($lsydom);
				}
				
				file_put_contents(CONFIG_DATA_DIR . '/__current__/' . $this->name, $this->configState->asXML());
			}else{
				// Append the new obsel to the stored trace (either loaded in memory or in a file).
				if(!$this->loaded)
				{
					fwrite($this->stateFD, $obsel->asXML());
				}else{
					SimpleXMLElement_append($this->trace, $obsel);
				}
				
				// Process the trace obsel with each existing symbole.
				foreach($this->configState->symboles->symbole as $symbole)
				{
					$this->symbolize($obsel, $symbole, $delta, $doc);
				}
				
				// Process the trace obsel with each existing long symboles.
				foreach($this->configState->{'long-symboles'}->lsymbole as $lsymbole)
				{
					$this->longSymbolize($obsel, $lsymbole, $delta, $doc);
				}
				$this->lastTraceObsel = $obsel;
			}
		}
	}
	
	protected function symbolize($obsel, $symbole, &$delta, &$doc)
	{
		//pushError("[[[");
		$xpathres = $obsel->xpath("(.)[" . (string)$symbole->condition . "]");
		//pushError("(.)[" . (string)$symbole->condition . "]" . " ]]]");
		if($xpathres !== false and count($xpathres) != 0)
		{
			$symboleElement = $doc->createElement('symbole');
			$symboleElement->setAttribute('date', $obsel['date']);
			$symboleElement->setAttribute('id', $obsel['id'] . "-sym" . $symbole['id']);
			$symboleElement->setAttribute('obsel-id', $obsel['id']);
			
			$symboleElement->setAttribute('shape', $symbole->shape);
			$symboleElement->setAttribute('color', $symbole->color);
			$symboleElement->setAttribute('voffset', $symbole->voffset);
			$symboleElement->setAttribute('image-url', $symbole->{'image-url'});
			
			$delta->appendChild($symboleElement);
			return $symboleElement;
		}
		return false;
	}
	
	/* Prepares the data doc to test a lsymbole condition on 
	 * [$lastObsel, $obsel] with lsymbole $symbole.
	 * The last obsel is supposed to be already in the doc.
	 */
	protected function prepareLSData($obsel, $symbole)
	{
		$data = $this->getDataDoc();
		$this->beginConditionText->replaceData(0, $this->beginConditionText->length, (string)$symbole->{'begin-condition'});
		$this->endConditionText->replaceData(0, $this->endConditionText->length, (string)$symbole->{'end-condition'});
		
		/*if($this->obselsDataElement->childNodes->length >= 2)
			$this->obselsDataElement->removeChild($this->obselsDataElement->lastChild);
		$this->obselsDataElement->insertBefore($data->importNode($obsel), $this->obselsDataElement->firstChild);*/
		if($this->obselsDataElement->childNodes->length >= 2)
			$this->obselsDataElement->removeChild($this->obselsDataElement->firstChild);
		$this->obselsDataElement->appendChild($data->importNode($obsel));
	}
	
	protected function longSymbolize($obsel, $symbole, &$delta, &$doc)
	{
		// XSLT stylesheet that generates the interval instructions (or empty nothing)
		// Will receive $this->lastTraceObsel, $obsel and $symbole->condition
		$this->prepareLSData(dom_import_simplexml($obsel), $symbole);
		
		$result = $this->getLSProc()->transformToDoc($this->getDataDoc());
		// In case something, append to delta
		if($result->documentElement and $result->documentElement->nodeType == XML_ELEMENT_NODE
		   and $result->documentElement->tagName == "result")
		{
			if($result->documentElement->getAttribute('value') != 'none')
			{
				// End the current long symbole
				$oldLS = $this->lsState->xpath("/state/current-ls[@ls-id='" . $symbole['id'] . "']");
				if($oldLS !== false and count($oldLS) > 0)
				{
					$oldLS = $oldLS[0];
					
					$symboleElement = $doc->createElement('finished-ls');
					$symboleElement->setAttribute('ls-id', $oldLS['ls-id']);
					$symboleElement->setAttribute('obsel-id', $obsel['id']);
					
					$delta->appendChild($symboleElement);
					
					$finalLS = $this->lsState->addChild("ls");
					$finalLS->addAttribute('id', $oldLS['id']);
					$finalLS->addAttribute('ls-id', $oldLS['ls-id']);
					
					$lsNode = dom_import_simplexml($oldLS);
					$lsNode->parentNode->removeChild($lsNode);
				}
				
				// Begin a new symbole if condition is reached
				if($result->documentElement->getAttribute('value') == 'begin')
				{
					$symboleElement = $doc->createElement('new-ls');
					$symboleElement->setAttribute('date', $obsel['date']);
					$symboleElement->setAttribute('id', $obsel['id'] . "-sym" . $symbole['id']);
					$symboleElement->setAttribute('ls-id', $symbole['id']);
					$symboleElement->setAttribute('obsel-id', $obsel['id']);
					
					$symboleElement->setAttribute('shape', $symbole->shape);
					$symboleElement->setAttribute('color', $symbole->color);
					$symboleElement->setAttribute('voffset', $symbole->voffset);
					$symboleElement->setAttribute('image-url', $symbole->{'image-url'});
					
					$delta->appendChild($symboleElement);
					
					// Adds the new lsymbole to the state
					$ls = $this->lsState->addChild("current-ls");
					$ls->addAttribute("id", $obsel['id'] . "-sym" . $symbole['id']);
					$ls->addAttribute('ls-id', $symbole['id']);
					$ls->addAttribute('obsel-id', $obsel['id']);
					
					return $symboleElement;	
				}
			}else{
				$ls = $this->lsState->xpath("/state/current-ls[@ls-id='" . $symbole['id'] . "']");
				if($ls !== false and count($ls) > 0)
				{
					$ls = $ls[0];
					
					$symboleElement = $doc->createElement('lengthen-ls');
					$symboleElement->setAttribute('date', $obsel['date']);
					$symboleElement->setAttribute('id', $ls['id']);
					$symboleElement->setAttribute('ls-id', $symbole['id']);
					$symboleElement->setAttribute('obsel-id', $obsel['id']);
					
					$delta->appendChild($symboleElement);
					return $symboleElement;
				}
			}
		}
		return false;
	}
	
	protected function loadTrace()
	{
		if(!$this->loaded)
		{
			fflush($this->stateFD);
			fclose($this->stateFD);
			$this->trace = simplexml_load_string("<slice>" . file_get_contents($this->stateFilename). "</slice>");
			$this->loaded = true;
		}
	}
	
	// Don't load anything unless absolutely necessary.
	protected function loadState()
	{
		$this->lastTraceObsel = new SimpleXMLElement('<none/>');
		$this->loaded = false;
		$this->xsltProc = null;
		$this->dataDoc = null;
		
		if(file_exists($this->stateFilename . '-ls'))
		{
			$this->lsState = simplexml_load_file($this->stateFilename . '-ls');
		}else{
			$this->lsState = simplexml_load_string("<state/>");
		}
		
		$this->stateFD = fopen($this->stateFilename, "a");
		if(file_exists(CONFIG_DATA_DIR . '/__current__/' . $this->name))
		{
			$this->configState = simplexml_load_file(CONFIG_DATA_DIR . '/__current__/' . $this->name);
		}else{
			$this->configState = simplexml_load_string("<config><symboles></symboles><long-symboles></long-symboles></config>");
		}
	}
	
	protected function forceSaveStateImpl()
	{
		file_put_contents($this->stateFilename . '-ls', $this->lsState->saveXML());
		file_put_contents(CONFIG_DATA_DIR . '/__current__/' . $this->name, $this->configState->saveXML());
		if($this->loaded)
		{
			$fd = fopen($this->stateFilename, "w");
			foreach($this->trace->children() as $trace_obsel)
			{
				fwrite($fd, $trace_obsel->asXML());
			}
			fclose($fd);
		}else{
			fflush($this->stateFD);
			fclose($this->stateFD);
		}
	}
	
	protected function cleanStateImpl()
	{
		if(! $this->loaded)
		{
			fflush($this->stateFD);
			fclose($this->stateFD);
		}
		
		parent::cleanStateImpl();
		
		/*if(file_exists($this->stateFilename . "-config"))
			if(!unlink($this->stateFilename . "-config"))
				pushError("Couldn't unlink '" . $this->stateFilename . "-config'");*/
	}
	
	protected function getLSProc()
	{
		if($this->xsltProc == null)
		{
			$this->xsltProc = new XSLTProcessor();
			
			$doc = new DOMDocument;
			$doc->load("detect-lsymbole.xsl");
			
			$this->xsltProc->importStylesheet($doc);
		}
		
		return $this->xsltProc;
	}
	
	protected function getDataDoc()
	{
		if($this->dataDoc == null)
		{
			$this->dataDoc = new DOMDocument();
			$test = $this->dataDoc->createElement("test");
			$beginCondition = $this->dataDoc->createElement("begin-condition");
			$endCondition = $this->dataDoc->createElement("end-condition");
			$this->beginConditionText = $this->dataDoc->createTextNode("");
			$this->endConditionText = $this->dataDoc->createTextNode("");
			$this->obselsDataElement = $this->dataDoc->createElement("obsels");
			
			$this->dataDoc->appendChild($test);
			$test->appendChild($beginCondition);
			$test->appendChild($endCondition);
			$beginCondition->appendChild($this->beginConditionText);
			$endCondition->appendChild($this->endConditionText);
			$test->appendChild($this->obselsDataElement);
			
			$this->initLSData($this->dataDoc);
		}
		
		return $this->dataDoc;
	}
	
	/* Init the data doc with the fist obsel of the trace. */
	protected function initLSData($data, $obsel = null)
	{
		while($this->obselsDataElement->childNodes->length > 0)
		{
			$this->obselsDataElement->removeChild($this->obselsDataElement->lastChild);
		}
		
		if($obsel == null)
		{
			$none = $data->createElement("none");
			$this->obselsDataElement->appendChild($data->importNode($none));
		}else{
			$this->obselsDataElement->appendChild($data->importNode($obsel));
		}
	}
	
	protected $beginConditionText;
	protected $dataDoc;
	protected $xsltProc;
	protected $loaded;
	protected $lastTraceObsel;
	protected $trace;
};