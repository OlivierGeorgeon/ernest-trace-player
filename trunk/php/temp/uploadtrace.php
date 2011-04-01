<html>
<head></head>
<body>
<?php 
require_once '../include/config.inc.php';
var_dump($_FILES);
var_dump($_POST);
if(isset($_POST["traceName"]) 
   and isset($_FILES["traceFile"]) and $_FILES["traceFile"]["error"] == 0
   and isset($_POST["selectionFile"]))
{
	$cann_fn = DATA_DIR . "/xml_traces/" . $_POST["traceName"];
	copy($_FILES["traceFile"]["tmp_name"], $cann_fn . ".xml");
	
	echo "File received. Transforming...<br />"; flush();
	$xslt_errors = shell_exec("xsltproc " . DATA_DIR . "/view/" . $_POST["selectionFile"] . ".xsl " . $cann_fn . ".xml > " . $cann_fn . "-selected.xml");
	echo "Done $xslt_errors !<br />";
	echo "<a href='../../example_list.php'>Back</a>";
}else{
	echo "You're doing it wrong.";
}

?>
</body>
</html>
