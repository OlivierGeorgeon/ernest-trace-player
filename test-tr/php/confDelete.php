<?php
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

	if(file_exists($confDir))
	{
		rrmdir($confDir);
	}
}