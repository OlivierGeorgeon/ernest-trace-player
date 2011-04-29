<?php
require_once 'include/config.inc.php';

header("Content-type", "application/xml");
foreach(glob(CONFIG_DATA_DIR . '/__current__/*') as $confFile)
{
	readfile($confFile);
}

?>