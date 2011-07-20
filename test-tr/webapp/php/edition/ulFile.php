<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(! ICANHASEDIT)
{
	http_send_status(401);
	die();
}

if(isset($_REQUEST['name']) and $name = filter_atom_filename($_REQUEST['name'])
	and isset($_REQUEST['type']) 
	and (isset($_FILES['file']['name']) and ($_FILES['file']['error'] == UPLOAD_ERR_OK)))
{
	$type = $_REQUEST['type'];

	if($type === 'pipeline')
	{
		$uploadfile = DATA_DIR . '/pipelines/' . $name;
		move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
	}elseif($type === 'transformation'){
		$uploadfile = DATA_DIR . '/pipelines/transformations/' . $name;
		move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
	}else{
		echo 'nan';
	}
}else{
	var_dump($_REQUEST);
	echo 'non';
}

?>
toto