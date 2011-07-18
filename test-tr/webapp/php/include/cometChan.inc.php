<?php
set_time_limit(0);
ignore_user_abort();

require_once 'include/session.inc.php';
require_once 'include/comet.inc.php';

if(! isset($_GET['PICometMethod']))
{
	die();
}

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

/*
 * pushError sends an notice to be displayed in the notification area.
 */
function pushError($text)
{
	global $comet;
	echo $comet->push("<error>"
		. htmlentities(htmlentities($text) . ".<br />") // Yes. Twice.
		. "</error>"); flush();
}

/*
 * Handle errors by displaying them thru pushError().
 */
function handle_error($errno, $errstr, $errfile, $errline)
{
	//Do not display @'ed errors.
	if (error_reporting() === 0)
    {
        return;
    }
	pushError("PHP error at $errfile:$errline: $errstr");
}

set_error_handler('handle_error', E_ALL);

header("Content-type: text/plain");

// Google chrome needs this or the stream will hang until 1024 bytes and an html element is sent.
if($comet->method == -1)
	echo str_pad("<br/>", 1024, " "); flush();
?>