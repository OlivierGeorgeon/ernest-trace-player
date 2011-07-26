<?php 
require_once 'include/session.inc.php';
require_once 'include/misc.inc.php';

if(ICANHASNOTHING)
{
	http_send_status(401);
	die();
}

$transfo_cookie = getRandomString(10);
$ret1 = null;
mkdir(TRANSFO_PUB_DIR . '/' . $transfo_cookie);
mkdir(TRANSFO_PUB_DIR . '/' . $transfo_cookie . '/pipelines');
mkdir(TRANSFO_PUB_DIR . '/' . $transfo_cookie . '/pipelines/transformations');
mkdir(TRANSFO_PUB_DIR . '/' . $transfo_cookie . '/pipelines/config');
system("cp -r " . DATA_DIR . '/pipelines/transformations/* ' . TRANSFO_PUB_DIR . '/' . $transfo_cookie . '/pipelines/transformations', $ret1);
//DATA_DIR . '/pipelines/transformations'
//TRANSFO_PUB_DIR . $transfo_cookie . '/pipelines/transformations'

$ret2 = null;
system("cp " . DATA_DIR . '/pipelines/pipeline.xml ' . TRANSFO_PUB_DIR . '/' . $transfo_cookie . '/pipelines/pipeline.xml', $ret2);
//DATA_DIR . '/pipelines/pipeline.xml'
//TRANSFO_PUB_DIR . $transfo_cookie . '/pipelines/pipeline.xml'

$ret3 = null;
system("cp -r " . CONFIG_DATA_DIR . '/__current__ ' . TRANSFO_PUB_DIR . '/' . $transfo_cookie . '/pipelines/config/__current__', $ret3);
//CONFIG_DATA_DIR . '/__current__'
//TRANSFO_PUB_DIR . $transfo_cookie . '/pipelines/config/__current__'

if(!($ret1==0 and $ret2==0 and $ret3==0))
{
	//rrmdir(TRANSFO_PUB_DIR . $transfo_cookie);
	echo '<error>Couldn\'t export to public : ' . $ret1 . $ret2 . $ret3 . '</error>';
}else{
	echo '<cookie>' . $transfo_cookie . '</cookie>';
}

?>