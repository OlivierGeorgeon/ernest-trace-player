<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/session.inc.php';
require_once 'include/user.inc.php';

if(isset($_REQUEST['password']) and isset($_REQUEST['password2']))
{
	if($_REQUEST['password'] !== $_REQUEST['password2'])
	{
		readfile('../../html/failedChange.html');
		die();
	}
	
	if(userSetPassword($_SESSION['username'], $_REQUEST['password']))
	{
		readfile('../../html/successChange.html');
	}else{
		readfile('../../html/failedChange.html');
		die();
	}
}else{
	readfile("../../html/changePassword.html");
}

?>