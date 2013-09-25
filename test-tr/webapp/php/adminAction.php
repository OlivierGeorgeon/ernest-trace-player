<?php
require_once 'include/session.inc.php';
require_once 'include/user.inc.php';

if(! ICANHASADMIN)
{
	die("You have not the right to rule here.");
}

if(isset($_REQUEST['action']))
{
	if ($_REQUEST['action'] === 'deleteuser')
	{
		//echo deleteUser($_REQUEST['username']);
		$username = $_REQUEST['username'];
		if(deleteUser($username))
			echo 'User ' . $username . ' deleted.';
		else{
			echo 'Failed to delete '. $username . ' (SQLite said : '. getUserDB()->lastErrorMsg() . ')';
		}
	}elseif ($_REQUEST['action'] === 'setuserrights')
	{
		if(userSetRights($_REQUEST['username'], 
			isset($_REQUEST['icanhasforms']) and $_REQUEST['icanhasforms']==="on",
			isset($_REQUEST['icanhasedit']) and $_REQUEST['icanhasedit']==="on", 
			isset($_REQUEST['icanhasadmin']) and $_REQUEST['icanhasadmin']==="on"))
			echo 'OK';
		else
			echo 'Failed, for some reason...';
	}
}else{
	echo 'OK';
}
?>