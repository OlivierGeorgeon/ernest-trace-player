<?php

class BufferReconfigureTransformation extends PHPTransformation
{
	public function transform_one_obsel($obsel, &$delta, &$doc)
	{
		if($obsel !== false)
		{
			if($obsel['source'] and $obsel['source'] == "__config__")
			{
				// Load the stored trace in its whole
				$this->loadTrace();
				
				if($obsel->type == "new-symbole")
				{
					// Append the new symbole to the symbole set.
					$this->newSymbole($obsel, $delta, $doc);
					
				}elseif($obsel->type == "delete-symbole")
				{
					$this->deleteSymbole($obsel, $delta, $doc);
				}elseif($obsel->type == "new-long-symbole")
				{
					// Append the new symbole to the symbole set.
					$this->newLSymbole($obsel, $delta, $doc);
				}elseif($obsel->type == "delete-long-symbole")
				{
					// Find the symboles instances drawn by the symbole being deleted,
					// and delete them from the displayed trace.
					$this->deleteLSymbole($obsel, $delta, $doc);
				}

				// Update the config file with the new config.
				$this->saveConfigState();
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
				$this->prepareLSDataWithObsel(dom_import_simplexml($obsel));
				foreach($this->configState->{'long-symboles'}->lsymbole as $lsymbole)
				{
					$this->longSymbolize($obsel, $lsymbole, $delta, $doc);
				}
				$this->lastTraceObsel = $obsel;
			}
		}
	}

	/*
	 * Manages the appearance of a new symbole rule.
	 */
	protected function newSymbole($obsel, &$delta, &$doc)
	{
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
	}
	
	/*
	 * Manages the deletion of an existing symbole rule.
	 */
	protected function deleteSymbole($obsel, &$delta, &$doc)
	{
		$id = $obsel['id'];
		$sid = $obsel['symbole-id'];
		
		// Generate a delete element for each symbole instance created by the deleted symbole
		$symboles = $this->sState->xpath("/state/sym[@s-id = '" . $sid . "']");
		$del = array();
		foreach($symboles as $sym)
		{
			$deleteElement = $doc->createElement('delete');
			$deleteElement->setAttribute('obsel-id', $sym['inst-id']);
			$deleteElement->setAttribute('id', $sym['orig-id']);

			$delta->appendChild($deleteElement);

			$del[] = dom_import_simplexml($sym);
		}
		
		// Also remove them from the symbole instances state.
		foreach($del as $elt)
		{
			$elt->parentNode->removeChild($elt);
		}
		
		// Remove the symbole from the config state.
		$symbole = $this->configState->symboles->xpath("symbole[@id='$sid']");
		$lsydom = dom_import_simplexml($symbole[0]);
		$lsydom->parentNode->removeChild($lsydom);
	}
	
	/*
	 * Manages the appaerance of a new symbole rule.
	 */
	protected function newLSymbole($obsel, &$delta, &$doc)
	{
		SimpleXMLElement_append($this->configState->{'long-symboles'}, $obsel->lsymbole);
					
		// Reprocess all the trace obsels for the new symbole.
		// Reinitialize the dom doc used with the stylesheet
		$this->initLSData($this->getDataDoc());
		foreach($this->trace->children() as $trace_obsel)
		{
			$this->prepareLSDataWithObsel(dom_import_simplexml($trace_obsel));
			$symboleElement = $this->longSymbolize($trace_obsel, $obsel->lsymbole, $delta, $doc, true);
		}
		
		$this->initLSData($this->getDataDoc(), dom_import_simplexml($this->lastTraceObsel));
	}
	
	/*
	 * Manages the deletion of an existing long symbole rule.
	 */
	protected function deleteLSymbole($obsel, &$delta, &$doc)
	{
		// Generate a ldelete element for each lsymbole instance created by the deleted lsymbole
		$lsymboles = $this->lsState->xpath("/state/ls[@ls-id = '" . $obsel['symbole-id'] . "']");
		$del = array();
		foreach($lsymboles as $ls)
		{
			$deleteElement = $doc->createElement('ldelete');
			$deleteElement->setAttribute('obsel-id', $ls['id']);

			$delta->appendChild($deleteElement);

			$del[] = dom_import_simplexml($ls);
		}
		
		// If there is an instance being drawn, delete it from the displayed trace.
		$lcurrent = $this->lsState->xpath("/state/current-ls[@ls-id = '" . $obsel['symbole-id'] . "']");
		if(count($lcurrent) > 0)
		{
			$ls = $lcurrent[0];
			$deleteElement = $doc->createElement('ldelete');
			$deleteElement->setAttribute('obsel-id', $ls['id']);

			$delta->appendChild($deleteElement);

			$del[] = dom_import_simplexml($ls);
		}
		
		// Also remove them from the symbole instances state.
		foreach($del as $elt)
		{
			$elt->parentNode->removeChild($elt);
		}
		
		// Remove the symbole from the config state.
		$lsymbole = $this->configState->{'long-symboles'}->xpath("lsymbole[@id='" . $obsel['symbole-id'] . "']");
		$lsydom = dom_import_simplexml($lsymbole[0]);
		$lsydom->parentNode->removeChild($lsydom);
	}
	
	/*
	 * Checks if a symbole should be created for the obsel by the symbole rule $symbole,
	 * and in this case adds the symbole ton construct to the delta.
	 * Returns : the symbole element added to the delta, or false if no symbole created.
	 */
	protected function symbolize($obsel, $symbole, &$delta, &$doc)
	{
		//If the obsel meets the symbole's conditions, add an symbole instance.
		$xpathres = $obsel->xpath("(.)[" . (string)$symbole->condition . "]");
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
			
			if(!empty($symbole->{'transform'}))
			{
				$symboleElement->setAttribute('transform', '');
				if(!empty($symbole->{'scaleX'})) $symboleElement->setAttribute('scaleX', $symbole->{'scaleX'});
				if(!empty($symbole->{'scaleY'})) $symboleElement->setAttribute('scaleY', $symbole->{'scaleY'});
				if(!empty($symbole->{'skewX'})) $symboleElement->setAttribute('skewX', $symbole->{'skewX'});
				if(!empty($symbole->{'skewY'})) $symboleElement->setAttribute('skewY', $symbole->{'skewY'});
				if(!empty($symbole->{'rotate'})) $symboleElement->setAttribute('rotate', $symbole->{'rotate'});
			}
			$delta->appendChild($symboleElement);
			
			// Adds the new symbole to the state
			$ls = $this->sState->addChild("sym");
			$ls->addAttribute("inst-id", $obsel['id'] . "-sym" . $symbole['id']);
			$ls->addAttribute('s-id', $symbole['id']);
			$ls->addAttribute('orig-id', $obsel['id']);
			
			return $symboleElement;
		}
		return false;
	}
	
	/*
	 * Prepares the data doc to test a lsymbole condition on
	 * [$lastObsel, $obsel].
	 * The last obsel is supposed to already present in the doc.
	 */
	protected function prepareLSDataWithObsel($obsel)
	{
		$data = $this->getDataDoc();
		
		if($this->obselsDataElement->childNodes->length >= 2)
		$this->obselsDataElement->removeChild($this->obselsDataElement->firstChild);
		$this->obselsDataElement->appendChild($data->importNode($obsel, true));
	}
	
	/*
	 * Prepares the data doc to test the lsymbole's conditions.
	 */
	protected function prepareLSDataWithSymbole($symbole)
	{
		$data = $this->getDataDoc();
		$this->beginConditionText->replaceData(0, $this->beginConditionText->length, (string)$symbole->{'begin-condition'});
		$this->endConditionText->replaceData(0, $this->endConditionText->length, (string)$symbole->{'end-condition'});
	}
	
	/*
	 * Checks if a long symbole should be created, lengthen or finished for 
	 * the obsel by the symbole rule $symbole, and in this case adds the 
	 * necessary instruction to the delta.
	 * Returns : the long symbole instruction element added to the delta, or false if no symbole created.
	 */
	protected function longSymbolize($obsel, $symbole, &$delta, &$doc, $repeat_obsel = false)
	{
		$symboleElement = false;
		// An XSLT stylesheet tests the symbole's conditions, as SimpleXML's
		// xpath doesn't support variables.
		// It receives $this->lastTraceObsel, $obsel and the $symbole conditions.
		$this->prepareLSDataWithSymbole($symbole);
		$result = $this->getLSProc()->transformToDoc($this->getDataDoc());
		
		if($result->documentElement and $result->documentElement->nodeType == XML_ELEMENT_NODE
		and $result->documentElement->tagName == "result")
		{
			$condValue = $result->documentElement->getAttribute('value');
			// If one of the conditions (begin or end) is met.
			if($condValue != 'none')
			{
				$noCurrent = true;
				// Get the current long symbole if one is being drawn.
				$oldLS = $this->lsState->xpath("/state/current-ls[@ls-id='" . $symbole['id'] . "']");
				if($oldLS !== false and count($oldLS) > 0)
				{
					$noCurrent = false;
					// If the end condition is met or no end condition and begin.
					if($condValue == 'end' or $condValue == 'both'
					or ($condValue == 'begin' and $this->endConditionText->wholeText == "")
					// or $this->endConditionText->wholeText == ""
					)
					{
						$noCurrent = true;
						
						$oldLS = $oldLS[0];
						
						$symboleElement = $doc->createElement('finished-ls');
						$symboleElement->setAttribute('ls-id', $oldLS['ls-id']);
						$symboleElement->setAttribute('obsel-id', $obsel['id']);
						$symboleElement->setAttribute('id', $oldLS['id']);
						
						if((string)$symbole->{'shape-end'} != '') {
							$symboleElement->setAttribute('shape', $symbole->{'shape-end'});
						}
						if((string)$symbole->{'color-end'} != '') {
							$symboleElement->setAttribute('color', $symbole->{'color-end'});
						}
						if((string)$symbole->{'voffset-end'} != '') {
							$symboleElement->setAttribute('voffset', $symbole->{'voffset-end'});
						}
						if((string)$symbole->{'image-url-end'} != '') {
							$symboleElement->setAttribute('image-url', $symbole->{'image-url-end'});
						}
						
						$delta->appendChild($symboleElement);
						
						$finalLS = $this->lsState->addChild("ls");
						$finalLS->addAttribute('id', $oldLS['id']);
						$finalLS->addAttribute('ls-id', $oldLS['ls-id']);
						
						$lsNode = dom_import_simplexml($oldLS);
						$lsNode->parentNode->removeChild($lsNode);
						
						if($repeat_obsel)
						{
							$obselElement = $doc->createElement('original-obsel');
							$obselElement->appendChild($doc->importNode(dom_import_simplexml($obsel), true));
							$symboleElement->appendChild($obselElement);
						}
					}
				}
				
				// Begin a new symbole if condition is met.
				if(($condValue == 'begin' or $condValue == 'both') and $noCurrent)
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
					
					if($repeat_obsel)
					{
						$obselElement = $doc->createElement('original-obsel');
						$obselElement->appendChild($doc->importNode(dom_import_simplexml($obsel), true));
						$symboleElement->appendChild($obselElement);
					}
				}
			}
			
			if($condValue == 'none'
			or ($condValue == 'begin' and $this->endConditionText->wholeText != ""))
			{
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
					
					if($repeat_obsel)
					{
						$obselElement = $doc->createElement('original-obsel');
						$obselElement->appendChild($doc->importNode(dom_import_simplexml($obsel), true));
						$symboleElement->appendChild($obselElement);
					}
				}
			}
		}
	}
	
	// Load the trace stored in the state file if not already done.
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
		
		if(file_exists($this->stateFilename . '-s'))
		{
			$this->sState = simplexml_load_file($this->stateFilename . '-s');
		}else{
			$this->sState = simplexml_load_string("<state/>");
		}
		
		$this->stateFD = fopen($this->stateFilename, "a");
		
		$confFileName = CONFIG_DATA_DIR . '/__current__/' . $this->name;
		$tempConfFileName = CONFIG_DATA_DIR . '/__temp__/' . $this->name;
		$lockFD = fopen($tempConfFileName . '.lock', 'c');
		if(flock($lockFD, LOCK_EX))
		{
			if(file_exists($confFileName))
			{
				if(file_exists($tempConfFileName . '.old'))
					unlink($tempConfFileName . '.old');
				// Yes.
				rename($confFileName, $tempConfFileName . '.old');
				copy($tempConfFileName . '.old', $confFileName);
				
				$this->configState = simplexml_load_file($confFileName);
			}else{
				$this->configState = simplexml_load_string("<config><symboles></symboles><long-symboles></long-symboles></config>");
			}
			
			$this->configStateFD = fopen($confFileName, 'w');
			$this->saveConfigState();
			
			flock($lockFD, LOCK_UN);
		}
	}
	
	protected function saveConfigState()
	{
		fseek($this->configStateFD, 0);
		ftruncate($this->configStateFD, 0);
		fwrite($this->configStateFD, $this->configState->asXML());
		fflush($this->configStateFD);
	}
	
	protected function forceSaveStateImpl()
	{
		file_put_contents($this->stateFilename . '-ls', $this->lsState->saveXML());
		file_put_contents($this->stateFilename . '-s', $this->sState->saveXML());
		$this->saveConfigState();
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
	}
	
	/*
	 * Get the XSLTProcessor used to test long symboles' conditions,
	 * already configured with the stylesheet.
	 */
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
	
	/*
	 * Get the DOMDocument used to test long symboles' conditions.
	 */
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
		
		if($obsel === null)
		{
			$none = $data->createElement("none");
			$this->obselsDataElement->appendChild($data->importNode($none, true));
		}else{
			$this->obselsDataElement->appendChild($data->importNode($obsel, true));
		}
	}
	
	protected $beginConditionText;
	protected $endConditionText;
	protected $obselsDataElement;
	protected $dataDoc;
	protected $xsltProc;
	protected $loaded;
	protected $lastTraceObsel;
	protected $trace;
	protected $lsState;
	protected $sState;
};