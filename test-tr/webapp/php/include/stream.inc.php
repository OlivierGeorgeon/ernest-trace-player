<?php
require_once 'include/misc.inc.php';
require_once 'include/config.inc.php';

/*
 * Posts an obsels into the system.
 * Posts it into the database, and pushes it into 
 * the realtime stream if it is open.
 * $traceId : the identifier of the trace to which the obsel belongs.
 * $data : the obsel data (string).
 */
function postObsel($traceId, $data)
{
	// Store the obesl on db.
	// First, extract the date to set to the date column.
	$xml_data = simplexml_load_string($data);
	if($xml_data !== false)
	{
		if( $date = $xml_data->xpath("/slice/@date")
			and $date = $date[0]
			and $date = $date['date']
		)
			dbStoreObsel($traceId, $date, $data);
		else
			dbStoreObsel($traceId, false, $data);
	}
	
	// Stream the obsel to the handler if one is running on this traces 
	streamPushObsel($traceId, $data);
}

/*
 * Pushes the given obsel into the $traceId trace stream if a server is listening. Or else does nothing. 
 */
function streamPushObsel($traceId, $data)
{
	$client = @stream_socket_client('unix://' . TEMP_DATA_DIR . '/streams/' . $traceId, $errno, $errstr);
	
	if($errno == 0 and $client !== false)
	{
		stream_set_blocking ($client, 1);
		fwrite($client, $data);
		fclose($client);
	}
}

/*
 * Opens a stream trace server for the $traceId trace.
 */
function streamOpen($traceId)
{
	@unlink(TEMP_DATA_DIR . '/streams/' . $traceId);
	$server = stream_socket_server('unix://' . TEMP_DATA_DIR . '/streams/' . $traceId,
			$errno, $errstr, STREAM_SERVER_BIND|STREAM_SERVER_LISTEN);
	stream_set_blocking ($server, 1);
	
	return $server;
}

/*
 * Closes the stream trace server for the $traceId trace.
 */
function streamClose($server, $traceId)
{
	stream_socket_shutdown($server, STREAM_SHUT_RDWR);
	@unlink(TEMP_DATA_DIR . '/streams/' . $traceId);
}

/*
 * Read an obsel from one of the given stream servers.
 * $serverArray : an array of servers (generated by streamOpen()).
 * $timeout : timeout in seconds.
 * Returns an array of two elements : (server, obsel_data).
 * Blocks $timeout seconds, and returns array(false, "") if no obsels came by this time.
 * In case of error, returns array(false, "").
 */
function streamGetObsel($serverArray, $timeout)
{
	$server = current($serverArray);
	while($server !== false and @($sock = stream_socket_accept($server, 0)) === false)
	{
		$server = next($serverArray);
	}
	reset($serverArray);
	
	if($server === false)
	{
		$read   = $serverArray;
		$write  = NULL;
		$except = NULL;
		
		$num_changed_streams = stream_select($read, $write, $except, $timeout);
		if ($num_changed_streams !== false && $num_changed_streams > 0)
		{
			$server = current($read);
			$sock = stream_socket_accept($server, 10);
		}else{
			//pushError("Select error...");
			return array(false, "");
		}
	}
	
	$slice = "";
	while($sock && !feof($sock))
	{
		$read = fread($sock, 1024);
		if($read !== false)
			$slice .= $read;
	}
	return array($server, $slice);
}

/*
 * Returns an open instance of SQLite3 db containing the trace obsels.
 * Only one different instance exists at any time. 
 */
function getDB()
{
	global $db;
	
	if(!isset($db))
	{
		$db = new SQLite3(DATA_DIR . '/trace_fragments.db');
		$db->busyTimeout(1000);

		$db->exec("CREATE TABLE IF NOT EXISTS obsels (trace_id VARCHAR, o_date FLOAT, o_data BLOB);" .
				  "CREATE INDEX IF NOT EXISTS 'index_obsels' ON 'obsels' ('trace_id', 'o_date');");
	}
	
	return $db;
}

/*
 * Store given obsel in database. 
 * $traceId : identifier of the obsel's trace.
 * $date : the obsel's date ; giving false results in +inf.
 * $data : the obsel's core data (string).
 */
function dbStoreObsel($traceId, $date, $data)
{
	$db = getDB();
	
	$data = $db->escapeString($data);
	$traceId = $db->escapeString($traceId);
	if($date != '' or $date !== false)
	{
		$date = floatval($date);
		$db->exec("INSERT INTO obsels VALUES ('$traceId', $date, '$data');");
	}else{
		$db->exec("INSERT INTO obsels VALUES ('$traceId', 9e999, '$data');"); // Alas, no portable way to say Infinity
	}
}

/*
 * Retreives the obsels of trace $traceId which dates are after $lastKnownDate 
 * and delete them from the base if $deleteAfterSelect is set to true.
 * Returns : an iterable containing associative arrays of the form ("o_date" => date, "o_data" => data).
 */
function dbGetObsels($traceId, $lastKnownDate, $deleteAfterSelect = false)
{
	$db = getDB();
	$lastKnownDate = floatval($lastKnownDate);
	$traceId = $db->escapeString($traceId);
	
	if($deleteAfterSelect)
		$db->exec("BEGIN;");
	
	$res = $db->query("SELECT o_date, o_data FROM obsels WHERE trace_id='$traceId' AND o_date>$lastKnownDate ORDER BY o_date ASC;");
	
	$rows = copyResultSet($res);
	
	if($deleteAfterSelect)
	{	
		$db->exec("DELETE FROM obsels WHERE trace_id='$traceId' AND o_date>$lastKnownDate; COMMIT;");
	}
	
	return $rows;
}

/*
 * Retreives all the obsels from trace $traceId, and delete 
 * them from the base if $deleteAfterSelect is set to true.
 * Returns : an iterable containing associative arrays of the form ("o_date" => date, "o_data" => data).
 */
function dbGetAllObsels($traceId, $deleteAfterSelect = false)
{
	$db = getDB();
	$traceId = $db->escapeString($traceId);
	
	if($deleteAfterSelect)
		$db->exec("BEGIN;");
		
	$res = $db->query("SELECT o_date, o_data FROM obsels WHERE trace_id='$traceId' ORDER BY o_date ASC;");
	
	$rows = copyResultSet($res);
	
	if($deleteAfterSelect)
	{	
		$db->exec("DELETE FROM obsels WHERE trace_id='$traceId'; COMMIT;");
	}
	
	return $rows;
}

/*
 * Finds the most recent obsel date of the given trace.
 */
function dbGetLastDate($traceId)
{
	$db = getDB();
	$traceId = $db->escapeString($traceId);
		
	return $db->querySingle("SELECT MAX(o_date) FROM obsels WHERE trace_id='$traceId';");
}

/*
 * Retreives a list of all the existing traces.
 * Returns : an iterable containing trace ids (strings).
 */
function dbGetTraces()
{
	$db = getDB();
	
	$res = $db->query("SELECT DISTINCT trace_id FROM obsels ORDER BY trace_id;");
	
	return copyResultSet($res);
}

/*
 * Serializes a trace's data into an xml string.
 */
function dbXMLDumpTrace($traceId)
{
	$db = getDB();
	$traceId = $db->escapeString($traceId);
	
	$res = $db->query("SELECT o_data FROM obsels WHERE trace_id='$traceId';");
	
	$xml = "<trace id=\"$traceId\">";
	while($row = $res->fetchArray(SQLITE3_NUM))
	{
		$xml .= $row[0];
	}
	$xml .= "</trace>";
	
	$res->finalize();
	
	return $xml;
}

/*
 * Load an xml serialized trace into the database.
 */
function dbXMLLoadTrace($xml)
{
	$db = getDB();
	$db->exec("begin;");
	$trace = simplexml_load_string($xml);
	if($trace !== false
		and isset($trace['id']))
	{
		$traceId = $trace['id'];
		foreach ($trace->children() as $slice)
		{
			if(isset($slice['date']))
			{
				$date = $slice['date'];
				dbStoreObsel($traceId, $date, $slice->asXML());
			}
		}
	}
	$db->exec("commit;");
}

/*
 * (Re)Initializes the obsel database.
 */
function initdb()
{
	$db = new SQLite3(DATA_DIR . '/trace_fragments.db');
	
	$db->exec(
		"DROP TABLE IF EXISTS obsels;" .
		"CREATE TABLE obsels (trace_id VARCHAR, o_date FLOAT, o_data BLOB);" .
		"CREATE INDEX 'index_obsels' ON 'obsels' ('trace_id', 'o_date');");
}

/*
 * Deletes a trace from database.
 */
function deleteStored($traceId)
{
	$db = getDB();
	
	$db->exec("DELETE FROM obsels WHERE trace_id = '$traceId'");
	//$db->exec("VACUUM"); // too slow: genereate database lock errors
}
?>