<?php
header("Content-type: application/xhtml+xml");
require_once 'include/config.inc.php';
require_once 'include/misc.inc.php';

echo "<configs>";

$config_files = scandir(CONFIG_DATA_DIR);
foreach($config_files as &$config)
{
	if($config != "." and $config != ".." and $config != "__current__")
	echo "<config name=\"$config\" />";
}

echo "</configs>";
?>