<?php

function postObsel($traceId, $data)
{
	touch('/tmp/streamed');

	$trace = fopen(TEMP_DATA_DIR . '/streams/' . $traceId, "a+");
	if(flock($trace, LOCK_EX))
	{
		fseek($trace, -1, SEEK_END);
		fwrite($trace, $data);
		fflush($trace);
		fclose($trace);
	}else{
		echo "<error>Couldn't get the lock on the trace file.</error>";
	}

	storeObsel($traceId, $data);
}

function storeObsel($traceId, $data)
{
	//TODO: use better storage solution (sqlite ?)
	$storedTrace = fopen(DATA_DIR . '/xml_trace_fragments/' . $traceId, "a+");
	fwrite($storedTrace, $data);
	fclose($storedTrace);
}

function deleteStored($traceId)
{
	$fn = DATA_DIR . '/xml_trace_fragments/' . $traceId;
	if(file_exists($fn))
	unlink($fn);
}
