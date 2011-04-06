<?php

class AggregateTTTTransformation extends PHPTransformation
{
	public function transform($deltas)
	{
		$my_delta = new DOMDocument();
		$delta = $my_delta->createElement("delta");
		$delta->setAttribute("source", $this->name);
		$my_delta->appendChild($delta);
		
		$deltas = simplexml_import_dom($deltas);
		$obsel = current($deltas->xpath("/deltas/delta/obsel"));
		
		if(count($obsel) && count($obsel->type) && $obsel->type == "action")
		{
			$obsel_ttt = null;
			if((string)$obsel->is_thristy == "true" or  (string)$obsel->is_thirsty == "true")
			{
				if(count($obsel->current_observation->children("time_to_water")))
					$obsel_ttt = (string)$obsel->current_observation->time_to_water;
				else
					$obsel_ttt = "Far";
			}else{
				if(count($obsel->current_observation->children("time_to_food")))
					$obsel_ttt = (string)$obsel->current_observation->time_to_food;
				else
					$obsel_ttt = "Far";
			}
			
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
				$new_instr = $my_delta->createElement("new-ttt");
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
			}else{
				if((string)$interval['color'] == $color)
				{
					//Instruction : Lengthen the current interval to the date of the current obsel
					$len_instr = $my_delta->createElement("lengthen-ttt", (string)$obsel["date"]);
						$len_instr->setAttribute("obsel-id", (string)$interval['id']);
					$delta->appendChild($len_instr);
					
					//Updating state
					$interval['end'] = $obsel["date"];
				}else{
					//Instruction : finish the current interval
					$fin_instr = $my_delta->createElement("finished-ttt");
						$fin_instr->setAttribute("obsel-id", (string)$interval['id']);
					$delta->appendChild($fin_instr);
					
					//Instruction : create a new interval
					$new_instr = $my_delta->createElement("new-ttt");
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
				}
			}
		}
		return $my_delta;
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