<?php
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(! ICANHASEDIT)
{
	http_send_status(401);
	die();
}

if(isset($_REQUEST['name']) and $name = filter_atom_filename($_REQUEST['name']) and isset($_REQUEST['type']))
{
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