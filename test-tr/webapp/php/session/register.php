<?php
set_include_path('..' . PATH_SEPARATOR . get_include_path());
require_once 'include/config.inc.php';
require_once 'include/user.inc.php';
session_start();

if(isset($_REQUEST['username']) and isset($_REQUEST['password']) and isset($_REQUEST['password2']))
{
	if($_REQUEST['password'] !== $_REQUEST['password2'])
	{
		readfile('../../html/failedNewUser.html');
		die();
	}
	
	if(newUser($_REQUEST['username'], $_REQUEST['password']))
	{
		$userInfos = getUserInfos($_REQUEST['username'], $_REQUEST['password']);
		system("cp -r " . BASE_DATA_DIR . "/default " . BASE_DATA_DIR . "/" . $userInfos['cookie']);
		
		readfile('../../html/successNewUser.html');
	}else{
		readfile('../../html/failedNewUser.html');
	}
}else{
	readfile('../../html/newUser.html');
}
?>
