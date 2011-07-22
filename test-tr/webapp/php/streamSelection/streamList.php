<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
header("Content-type: application/xhtml+xml");
require_once 'include/session.inc.php';
require_once 'include/stream.inc.php';

$traces = dbGetTraces();

echo "<ul>";
foreach($traces as $trace)
{
	echo "<li title=\"" . $trace['trace_id'] . "\">" .
		"<a title=\"stream\" href=\"#\">▶ " . $trace['trace_id'] . "</a> " .
		"<a title=\"delete-stored\" href=\"#\">✗</a>" .
		"<a title=\"download\" href=\"#\">⇩</a>" .
		"</li>";
}

echo "</ul>";
?>