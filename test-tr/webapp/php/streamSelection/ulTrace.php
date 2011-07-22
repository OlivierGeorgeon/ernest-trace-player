<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';
require_once 'include/stream.inc.php';

if(isset($_FILES['file']['name']) and ($_FILES['file']['error'] == UPLOAD_ERR_OK))
{
	if(is_uploaded_file($_FILES['file']['tmp_name']))
	{
		dbXMLLoadTrace(file_get_contents($_FILES['file']['tmp_name']));
	}
}

?>