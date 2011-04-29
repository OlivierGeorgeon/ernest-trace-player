<?php
require_once 'include/config.inc.php';
require_once 'include/misc.inc.php';

if(isset($_REQUEST['configId']))
{
	$confDir = CONFIG_DATA_DIR . '/' . $_REQUEST['configId'];
	
	if(file_exists($confDir))
	{
		rrmdir($confDir);
	}
}