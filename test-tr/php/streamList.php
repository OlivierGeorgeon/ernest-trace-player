<?php
header("Content-type: application/xhtml+xml");
require_once 'include/config.inc.php';
require_once 'include/stream.inc.php';

$traces = dbGetTraces();

echo "<ul>";
//$stream_files = scandir(TEMP_DATA_DIR . "/streams");
foreach($traces as $trace)
{
	echo "<li title=\"" . $trace['trace_id'] . "\"><a title=\"stream\" href=\"#\">▶ " . $trace['trace_id'] . "</a> <a title=\"delete-stored\" href=\"#\">✗</a></li>";
}

echo "</ul>";
?>