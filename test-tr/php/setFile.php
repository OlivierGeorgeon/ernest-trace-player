<?php 
require_once 'include/config.inc.php';
require_once 'include/misc.inc.php';

if(isset($_REQUEST['name']) and isset($_REQUEST['type']) and isset($_REQUEST['data']))
{
	$name = $_REQUEST['name'];
	$type = $_REQUEST['type'];
	
	if($type === 'pipeline')
	{
		file_put_contents(DATA_DIR . '/pipelines/' . $name, $_REQUEST['data']);
	}elseif($type === 'transformation')
	{
		file_put_contents(DATA_DIR . '/pipelines/transformations/' . $name, $_REQUEST['data']);
	}
}

?>