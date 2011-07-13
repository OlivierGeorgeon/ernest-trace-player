<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(! ICANHASFORMS)
{
	http_send_status(401);
	die();
}

if(isset($_REQUEST['configId']) and $configId = filter_lnd($_REQUEST['configId']))
{
	$confDir = CONFIG_DATA_DIR . '/' . $configId;

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
