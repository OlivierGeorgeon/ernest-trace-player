<?php
require_once 'include/config.inc.php';
require_once 'include/stream.inc.php';

if(isset($_REQUEST['id']))
{
	$id = $_REQUEST['id'];
	
	$config = new SimpleXMLElement('<root><config/></root>');
	$config->config->addAttribute('date', '0');
	$config->config->addAttribute('id', '1');
	$config->config->addAttribute('source', '__config__');
	$config->config->addChild('type', 'delete-symbole');
	$config->config->addAttribute('symbole-id', $id);
	
	postObsel('__config__', $config->config->asXML());
}

?>