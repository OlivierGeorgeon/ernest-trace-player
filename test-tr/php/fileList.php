<?php
// List pipeline and transformation files.
header("Content-type: application/xhtml+xml");
require_once 'include/config.inc.php';
require_once 'include/misc.inc.php';

echo "<files>";
$files = scandir(DATA_DIR . "/pipelines");
foreach($files as $file)
{
	if(is_file(DATA_DIR . "/pipelines/" . $file))
	echo "<file name=\"$file\" type=\"pipeline\" />";
}

$files = scandir(DATA_DIR . "/pipelines/transformations");
foreach($files as $file)
{
	if(is_file(DATA_DIR . "/pipelines/transformations/" . $file))
	echo "<file name=\"$file\" type=\"transformation\" />";
}

echo "</files>";
?>