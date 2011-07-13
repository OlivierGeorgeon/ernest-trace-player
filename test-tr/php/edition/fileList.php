<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
// List pipeline and transformation files.
header("Content-type: application/xhtml+xml");
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(! ICANHASEDIT)
{
	http_send_status(401);
	die();
}

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