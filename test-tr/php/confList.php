<?php
header("Content-type: application/xhtml+xml");
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(! ICANHASFORMS)
{
	http_send_status(401);
	die();
}

echo "<configs>";

$config_files = scandir(CONFIG_DATA_DIR);
foreach($config_files as &$config)
{
	if($config != "." and $config != ".." and $config != "__current__" and $config != "__temp__")
	echo "<config name=\"$config\" />";
}

echo "</configs>";
?>