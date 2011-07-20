<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/misc.inc.php';

if(isset($_REQUEST['name']) and $name = filter_atom_filename($_REQUEST['name']) and isset($_REQUEST['type']))
{
	header('Content-Disposition: attachment; filename=' . $_REQUEST['type'] . '/' . $_REQUEST['name']);
	require_once 'include/session.inc.php';
	
	if(! ICANHASEDIT)
	{
		http_send_status(401);
		die();
	}

	$type = $_REQUEST['type'];

	if($type === 'pipeline')
	{
		readfile(DATA_DIR . '/pipelines/' . $name);
	}elseif($type === 'transformation')
	{
		readfile(DATA_DIR . '/pipelines/transformations/' . $name);
	}

}

?>