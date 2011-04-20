<?php
header("Content-type: application/xhtml+xml");
require_once 'include/config.inc.php';

echo "<ul>";
$stream_files = scandir(TEMP_DATA_DIR . "/streams");
foreach($stream_files as &$stream)
{
	if($stream != "." and $stream != "..")
		echo "<li><a href=\"#\" title=\"" . $stream . "\">" . $stream . "</a></li>";			
}
echo "</ul>";
?>