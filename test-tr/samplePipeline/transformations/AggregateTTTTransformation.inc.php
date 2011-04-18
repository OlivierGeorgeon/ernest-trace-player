<?php

class AggregateTTTTransformation extends PHPTransformation
{
	
	public function doTransform($deltas)
	{
		$my_doc = new DOMDocument();
		$my_deltas = $my_doc->createElement("deltas");
		$my_doc->appendChild($my_deltas);
		
		$deltas = simplexml_import_dom($deltas);
		$delta = $deltas->xpath("/deltas/delta");
		
		$last_date = null;
		$merged_deltas = array();
		foreach($delta as &$one_delta)
		{
			if($last_date === null or $last_date == intval($one_delta['date']))
			{
				foreach($one_delta->children() as $obsel)
					$merged_deltas[] = $obsel;
			}else{
				$this->transform_many_obsels($merged_deltas, $last_date);
				
				$merged_deltas = array();
				$merged_deltas[] = $obsel;
			}
			$last_date = intval($one_delta['date']);
		}
		
		if(count($merged_deltas) != 0)
		{
			$this->transform_many_obsels($merged_deltas, $last_date, $my_doc, $my_deltas);
		}
		
		return $my_doc;
	}
	
	public function transform_many_obsels($merged_deltas, $date, &$doc, &$deltasElement)
	{
		$deltaElement = $doc->createElement("delta");
		$deltaElement->setAttribute("source", $this->name);
		$deltaElement->setAttribute("date", $date);
		$deltasElement->appendChild($deltaElement);
		
		foreach($merged_deltas as $obsel)
		{
			$this->transform_one_obsel($obsel, $deltaElement, $doc);
		}
	}
	
	public function transform_one_obsel($obsel, &$delta, &$doc)
	{
		$need = null;
		
		if($obsel !== false && count($obsel->type) && $obsel->type == "action")
		{
			$obsel_ttt = null;
			if((string)$obsel->is_thristy == "true" or  (string)$obsel->is_thirsty == "true")
			{
				$need = "thirsty";
				if(count($obsel->current_observation->time_to_water))
					$obsel_ttt = (string)$obsel->current_observation->time_to_water;
				else
					$obsel_ttt = "Far";
			}else{
				$need = "hungry";
				if(count($obsel->current_observation->time_to_food))
					$obsel_ttt = (string)$obsel->current_observation->time_to_food;
				else
					$obsel_ttt = "Far";
			}
			
			if($obsel_ttt == '1000')
				$obsel_ttt = 'Far';
			
			$color = null;
			if(count($obsel->current_observation->color))
			{
				$color = (string)$obsel->current_observation->color;
			}else{
				$color = "008000";
			}
			
				
			$interval = null;
			if(! (count($this->state->interval) && ($interval = $this->state->interval)))
			{
				//Instruction : create a new interval
				$new_instr = $doc->createElement("new-ttt");
					$new_instr->setAttribute("begin", $obsel["date"]);
					$new_instr->setAttribute("end", $obsel["date"]);
					$new_instr->setAttribute("ttt-value", $obsel_ttt);
					$new_instr->setAttribute("color", $color);
					$new_instr->setAttribute("id", $obsel["id"]."^ttt");
				$delta->appendChild($new_instr);
				
				//Updating state
				$interval = $this->state->addChild("interval");
					$interval->addAttribute("begin", $obsel["date"]);
					$interval->addAttribute("end", $obsel["date"]);
					$interval->addAttribute("ttt-value", $obsel_ttt);
					$interval->addAttribute("color", $color);
					$interval->addAttribute("id", $obsel["id"]."^ttt");
					$interval->addAttribute("need", $need);
					$interval->addAttribute("max-ttt", $obsel_ttt);
			}else{
				$max_ttt = null;
				if($need != $interval['need'])
				{
					if($obsel_ttt != "Far")
						$max_ttt = $obsel_ttt;
					else
						$max_ttt = 1000;
				}else{
					$max_ttt = $interval['max-ttt'];
				}
				
				if($max_ttt == 0.0)
				{
					$obsel_ttt = "Far";
					
					if($obsel_ttt != "Far")
						$obsel_ttt = $obsel_ttt*100.0 / $max_ttt;
					
					if($obsel_ttt > 100)
						$obsel_ttt = "Far";
				}
				
				if((string)$interval['color'] == $color)
				{
					//Instruction : Lengthen the current interval to the date of the current obsel
					$len_instr = $doc->createElement("lengthen-ttt", (string)$obsel["date"]);
						$len_instr->setAttribute("obsel-id", (string)$interval['id']);
					$delta->appendChild($len_instr);
					
					//Updating state
					$interval['end'] = $obsel["date"];
					$interval['need'] = $need;
					$interval['max-ttt'] = $max_ttt;
				}else{
					//Instruction : finish the current interval
					$fin_instr = $doc->createElement("finished-ttt");
						$fin_instr->setAttribute("obsel-id", (string)$interval['id']);
					$delta->appendChild($fin_instr);
					
					//Instruction : create a new interval
					$new_instr = $doc->createElement("new-ttt");
						$new_instr->setAttribute("begin", $obsel["date"]);
						$new_instr->setAttribute("end", $obsel["date"]);
						$new_instr->setAttribute("ttt-value", $obsel_ttt);
						$new_instr->setAttribute("color", $color);
						$new_instr->setAttribute("id", $obsel["id"]."^ttt");
					$delta->appendChild($new_instr);
					
					//Updating state
					$interval['begin'] = $obsel["date"];
					$interval['end'] = $obsel["date"];
					$interval['ttt-value'] = $obsel_ttt;
					$interval['color'] = $color;
					$interval['id'] = $obsel["id"]."^ttt";
					$interval['need'] = $need;
					$interval['max-ttt'] = $max_ttt;
				}
			}
		}
	}
	
	public function forceSaveState()
	{
		file_put_contents($this->stateFilename, $this->state->saveXML());
	}
	
	protected function loadState()
	{
		$this->state = simplexml_load_file($this->stateFilename);
	}
};