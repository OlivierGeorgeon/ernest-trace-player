<?php
/**
 * @author kweij at lsg dot nl
 */
function SimpleXMLElement_append(&$key, $value) {
	// check class
	if ((get_class($key) == 'SimpleXMLElement') && (get_class($value) == 'SimpleXMLElement')) {
		// check if the value is string value / data
		if (trim((string) $value) == '') {
			// add element and attributes
			$element = $key->addChild($value->getName());
			foreach ($value->attributes() as $attKey => $attValue) {
				$element->addAttribute($attKey, $attValue);
			}
			// add children
			foreach ($value->children() as $child) {
				SimpleXMLElement_append($element, $child);
			}
		} else {
			// set the value of this item
			$element = $key->addChild($value->getName(), trim((string) $value));
		}
	} else {
		// throw an error
		throw new Exception('Wrong type of input parameters, expected SimpleXMLElement');
	}
}

/**
 * Found on www.phpf1.com.
 */
function getRandomString($length = 6) {
	$validCharacters = "abcdefghijklmnopqrstuxyvwzABCDEFGHIJKLMNOPQRSTUXYVWZ-";
	$validCharNumber = strlen($validCharacters);

	$result = "";
	for ($i = 0; $i < $length; $i++) {
		$index = mt_rand(0, $validCharNumber - 1);
		$result .= $validCharacters[$index];
	}
	return $result;
}

/**
 * @author holger1 at NOSPAMzentralplan dot de
 */
function rrmdir($dir) {
	if (is_dir($dir)) {
		$objects = scandir($dir);
		foreach ($objects as $object) {
			if ($object != "." && $object != "..") {
				if (filetype($dir."/".$object) == "dir") rrmdir($dir."/".$object); else unlink($dir."/".$object);
			}
		}
		reset($objects);
		rmdir($dir);
	}
}

/*
 * Copies and finalize an SQLite3Result.
 * Private.
 */
function copyResultSet(&$resultSet)
{
	$rows = array();
	while($row = $resultSet->fetchArray(SQLITE3_ASSOC))
	{
		$rows[] = $row;
	}
	$resultSet->finalize();
	
	return $rows;
}

function filter_lnd($str)
{
	return filter_var($str, FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => '/^[a-zA-Z0-9-]+$/')));
}

function filter_atom_filename($str)
{
	return filter_var($str, FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => '/^[a-zA-Z0-9_-][a-zA-Z0-9._-]*$/')));
}

?>