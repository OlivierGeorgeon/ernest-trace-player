<?php
require_once __DIR__ . '/config.inc.php';
require_once __DIR__ . '/user.inc.php';
session_start();
if(!isset($_SESSION['identified']) or (isset($_REQUEST['streamcookie']) and $_SESSION['cookie'] != $_REQUEST['streamcookie']))
{
	if(!isset($_REQUEST['streamcookie']) or ! $cookie = filter_atom_filename($_REQUEST['streamcookie']))
	{
		$cookie = getRandomString(10);
	}
	
	deleteTemporaryUsers();
	
	$username = 'guest-' . getRandomString(10);
	newUser($username, $username, $cookie);
	$userInfos = getUserInfos($username, $username);
	system("cp -r " . BASE_DATA_DIR . "/default " . BASE_DATA_DIR . "/" . $userInfos['cookie']);
	
	if(count($userInfos) > 0)
	{
		$_SESSION['identified'] = true;
		$_SESSION['username'] = $userInfos['username'];
		$_SESSION['cookie'] = $userInfos['cookie'];
		$_SESSION['icanhasadmin'] = $userInfos['icanhasadmin'];
		$_SESSION['icanhasforms'] = $userInfos['icanhasforms'];
		$_SESSION['icanhasedit'] = $userInfos['icanhasedit'];
		$_SESSION['icanhasnothing'] = !($userInfos['icanhasedit'] or $userInfos['icanhasforms'] or $userInfos['icanhasadmin']);
		
		$_SESSION['firstload'] = true;
		
		header('Location: ' . $_SERVER['SCRIPT_NAME']);
	}else{
		die("Wat.");
	}
}else{
	$_SESSION['firstload'] = false;
}

if($_SESSION['identified'] === true)
{
	define('ICANHASFORMS', $_SESSION['icanhasforms']);
	define('ICANHASEDIT', $_SESSION['icanhasedit']);
	define('ICANHASADMIN', $_SESSION['icanhasadmin']);
	define('ICANHASNOTHING', $_SESSION['icanhasnothing']);
	
	define('USER_DATA_DIR', $_SESSION['cookie']);
}else{
	define('ICANHASFORMS', false);
	define('ICANHASEDIT', false);
	define('ICANHASADMIN', false);
	define('ICANHASNOTHING', true);
	define('USER_DATA_DIR', 'noblody');
}


define('DATA_DIR', BASE_DATA_DIR . '/' . USER_DATA_DIR);
define('VIEW_DATA_DIR', DATA_DIR . '/view');
define('CONFIG_DATA_DIR', DATA_DIR . '/pipelines/config');
define('TEMP_DATA_DIR', DATA_DIR . '/temp');

session_write_close();
userDBClose();
?>