<?php
header("Content-type: application/xhtml+xml");
require_once 'include/config.inc.php';

echo "<ul>";
$stream_files = scandir(TEMP_DATA_DIR . "/streams");
foreach($stream_files as &$stream)
{
	if($stream != "." and $stream != "..")
	echo "<li title=\"" . $stream . "\"><a title=\"stream\" href=\"#\">▶ " . $stream . "</a></li>";
}

$stream_files = scandir(DATA_DIR . "/xml_trace_fragments");
foreach($stream_files as &$stream)
{
	if($stream != "." and $stream != "..")
	echo "<li title=\"" . $stream . "\"><a title=\"stored\" href=\"#\">▮▮ " . $stream . "</a> <a title=\"delete-stored\" href=\"#\">✗</a></li>";
}
echo "</ul>";
?>