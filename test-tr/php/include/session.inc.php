<?php
require_once __DIR__ . '/config.inc.php';
require_once __DIR__ . '/user.inc.php';

// To avoid conflict with guestSession.inc.php, that could have opened and 
// closed a session in before.
if(! isset($_SESSION))
{
	session_start();
	
	if(!isset($_SESSION['identified']))
	{
		if(isset($_REQUEST['username']) and isset($_REQUEST['password']))
		{
			$userInfos = getUserInfos($_REQUEST['username'], $_REQUEST['password']);
			
			if(count($userInfos) > 0)
			{
				$_SESSION['identified'] = true;
				$_SESSION['username'] = $userInfos['username'];
				$_SESSION['cookie'] = $userInfos['cookie'];
				$_SESSION['icanhasadmin'] = $userInfos['icanhasadmin'];
				$_SESSION['icanhasforms'] = $userInfos['icanhasforms'];
				$_SESSION['icanhasedit'] = $userInfos['icanhasedit'];
				$_SESSION['icanhasnothing'] = !($userInfos['icanhasedit'] or $userInfos['icanhasforms'] or $userInfos['icanhasadmin']);
				
				header('Location: ' . $_SERVER['SCRIPT_NAME']);
			}else{
				readfile(__DIR__ . '/../../html/failedIdentify.html');
				die();
			}
		}else{
			readfile(__DIR__ . '/../../html/identify.html');
			die();
		}
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
}
?>