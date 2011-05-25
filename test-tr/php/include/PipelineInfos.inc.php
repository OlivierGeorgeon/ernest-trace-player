<?php
require_once('include/config.inc.php');

class PipelineInfos
{
	public function __construct()
	{

	}

	public function load($pipelineId)
	{
		$complete_filename = DATA_DIR . '/pipelines/' . $pipelineId . '.xml';
		if(! file_exists($complete_filename))
		die('This pipeline (' . $complete_filename . ')doesn \'t exists');

		$this->id = $pipelineId;

		if(! $XMLPipelineDoc = simplexml_load_file($complete_filename))
		return false;

		$this->levels = array();

		$levelsXE = $XMLPipelineDoc->levels;
		foreach($levelsXE->children() as $levelXE)
		{
			$level_infos = array();
				
			foreach($levelXE->children() as $transXE)
			{
				$name = (string)$transXE->name;
				$level_infos[$name] = array();
				$level_infos[$name]['sources'] = array();

				$sourcesXE = $transXE->sources;
				foreach($sourcesXE->children() as $sourceXE)
				{
					$level_infos[$name]['sources'][] = (string)$sourceXE;
				}

				$level_infos[$name]['type'] = (string)$transXE['type'];
				$level_infos[$name]['file'] = DATA_DIR . '/pipelines/transformations/' . (string)$transXE->file;
				if($level_infos[$name]['type'] == "PHP")
				{
					$level_infos[$name]['classname'] = (string)$transXE->classname;
				}
			}
				
			$this->levels[] = $level_infos;
		}

		$this->output = array();

		$outputXE = $XMLPipelineDoc->output;
		foreach($outputXE->children() as $sourceXE)
		{
			$this->output[] = (string)$sourceXE;
		}

		return true;
	}

	public function passInfosXML()
	{
		if(file_exists(DATA_DIR . '/pipelines/' . $this->id . '.xml'))
		readfile(DATA_DIR . '/pipelines/' . $this->id . '.xml');
	}

	public function transformations_include_path()
	{
		return DATA_DIR . '/pipelines/';
	}

	public $levels;
	public $output;

}