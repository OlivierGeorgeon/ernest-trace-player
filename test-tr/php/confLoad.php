<?php
require_once 'include/config.inc.php';
require_once 'include/misc.inc.php';

if(isset($_REQUEST['configId']))
{
	$confDir = CONFIG_DATA_DIR . '/' . $_REQUEST['configId'];
	
	if(!file_exists($confDir))
	{
		die("No such configuration.");
	}
	
	//Delete current config states from state dir
	foreach (glob(CONFIG_DATA_DIR . '/__current__/*') as $configFile)
	{
		unlink($configFile);
	}
	
	//Copy wanted config into state dir
	foreach (glob($confDir . "/*") as $configFile)
	{
		copy($configFile, CONFIG_DATA_DIR . '/__current__/' . basename($configFile));
	}
}
