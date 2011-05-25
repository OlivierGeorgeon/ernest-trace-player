<?php
require_once 'include/config.inc.php';
require_once 'include/stream.inc.php';
require_once 'include/misc.inc.php';

/*<config date="0" id="1" source='__config__'>
 <type>new-symbole</type>
 <symbole>
 <condition>primitive_enacted_schema='>'</condition>
 <shape>'pollen'</shape>
 <color>'FF0000'</color>
 <voffset>math:random()*30</voffset>
 <image-url>''</image-url>
 </symbole>
 </config>*/

if( isset($_REQUEST['begin-condition'])
and isset($_REQUEST['shape'])
and isset($_REQUEST['color'])
and isset($_REQUEST['voffset'])
)
{
	$beginCondition = $_REQUEST['begin-condition'];
	$endCondition = $_REQUEST['end-condition'];
	$shape = $_REQUEST['shape'];
	$color = $_REQUEST['color'];
	$voffset = $_REQUEST['voffset'];
	$imageUrl = isset($_REQUEST['image-url']) ? $_REQUEST['image-url'] : '';

	$config = new SimpleXMLElement('<root><config/></root>');
	$config->config->addAttribute('date', '0');
	$config->config->addAttribute('id', '1');
	$config->config->addAttribute('source', '__config__');
	$config->config->addChild('type', 'new-long-symbole');
	$symbole = $config->config->addChild('lsymbole');
	$symbole->addChild('begin-condition', $beginCondition);
	$symbole->addChild('end-condition', $endCondition);
	$symbole->addAttribute('id', getRandomString(10));
	$symbole->addChild('shape', $shape);
	$symbole->addChild('color', $color);
	$symbole->addChild('voffset', $voffset);
	$symbole->addChild('image-url', $imageUrl);

	postObsel('__config__', $config->config->asXML());
}

?>