<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/session.inc.php';
require_once 'include/stream.inc.php';

$date = intval(dbGetLastDate("Test-trace")) + 1;

postObsel("Test-trace", '<slice date="' . $date . '">
	<event date="' . $date . '" id="' . $date . '" source="Ernest">
		<type>action</type>
		<clock>' . $date . '</clock>
		<foo>bar</foo>
		<bar><foo>foobar</foo></bar>
	</event>
</slice>');

?>