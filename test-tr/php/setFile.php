<?php
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(! ICANHASEDIT)
{
	http_send_status(401);
	die();
}

if(isset($_REQUEST['name']) and $name = filter_atom_filename($_REQUEST['name'])
	and isset($_REQUEST['type']) and isset($_REQUEST['data']))
{
	$type = $_REQUEST['type'];

	if($type === 'pipeline')
	{
		file_put_contents(DATA_DIR . '/pipelines/' . $name, $_REQUEST['data']);
	}elseif($type === 'transformation')
	{
		file_put_contents(DATA_DIR . '/pipelines/transformations/' . $name, $_REQUEST['data']);
	}
}

?>