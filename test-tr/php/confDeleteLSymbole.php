<?php
require_once 'include/session.inc.php';
require_once 'include/stream.inc.php';

if(! ICANHASFORMS)
{
	http_send_status(401);
	die();
}

if(isset($_REQUEST['id']) and $symboleId = filter_lnd($_REQUEST['id']))
{
	$config = new SimpleXMLElement('<root><config/></root>');
	$config->config->addAttribute('date', '');
	$config->config->addAttribute('id', '1');
	$config->config->addAttribute('source', '__config__');
	$config->config->addChild('type', 'delete-long-symbole');
	$config->config->addAttribute('symbole-id', $symboleId);

	postObsel('__config__', $config->config->asXML());
}

?>