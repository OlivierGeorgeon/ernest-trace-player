<?php

require_once 'include/config.inc.php';
require_once 'include/comet.inc.php';

$piCometMethod = $_GET['PICometMethod'];
/*
 * Comet stream. pushElement immediatly sends an element to the player.
 */
$comet = new PIComet($piCometMethod, 'paparapaaaa');
function pushElement($text)
{
	global $comet;
	echo $comet->push($text); flush();
}

function pushError($text)
{
	global $comet;
	echo $comet->push("<error>" 
		. htmlentities(htmlentities($text) . ".<br />") // Yes.
		. "</error>"); flush();
}

function handle_error($errno, $errstr, $errfile, $errline)
{
	pushError("PHP error at $errfile:$errline: $errstr");
}

set_error_handler(handle_error, E_ALL);
?>