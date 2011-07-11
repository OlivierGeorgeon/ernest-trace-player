<?php
header("Content-type", "application/xml");
require_once 'include/session.inc.php';

if(! ICANHASFORMS)
{
	http_send_status(401);
	die();
}

foreach(glob(CONFIG_DATA_DIR . '/__current__/*') as $confFile)
{
	readfile($confFile);
}

?>