<?php
require_once 'include/config.inc.php';
require_once 'include/misc.inc.php';

if(isset($_REQUEST['name']) and isset($_REQUEST['type']))
{
	$name = $_REQUEST['name'];
	$type = $_REQUEST['type'];

	if($type === 'pipeline')
	{
		readfile(DATA_DIR . '/pipelines/' . $name);
	}elseif($type === 'transformation')
	{
		readfile(DATA_DIR . '/pipelines/transformations/' . $name);
	}

}

?>