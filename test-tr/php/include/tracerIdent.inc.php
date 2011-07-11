<?php
require_once __DIR__ . '/config.inc.php';
require_once __DIR__ . '/misc.inc.php';
 
if(isset($_REQUEST['streamcookie'])
	and $cookie = filter_lnd($_REQUEST['streamcookie'])
	and is_dir(BASE_DATA_DIR . '/' . $cookie))
{
	define('USER_DATA_DIR', $cookie);
	define('DATA_DIR', BASE_DATA_DIR . '/' . USER_DATA_DIR);
	define('VIEW_DATA_DIR', DATA_DIR . '/view');
	define('CONFIG_DATA_DIR', DATA_DIR . '/pipelines/config');
	define('TEMP_DATA_DIR', DATA_DIR . '/temp');
}else{
	http_send_status(401);
	die();
}

?>