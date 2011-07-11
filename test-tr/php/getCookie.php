<?php 
require_once 'include/session.inc.php';
require_once 'include/user.inc.php';
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>My cookie</title>
	</head>
	<body style="text-align: center;">
		<div align="center" style="display: inline-block; text-align: left; border: 1px solid gray; padding: 7px; padding-top: 2px; margin-top: 25%;">
			
			<div style="display: block; margin-bottom: 5px; color: gray">My cookie.</div>
			<div style="text-align: center">
<?php 
echo "Your cookie is '" . $_SESSION['cookie'] . "'.<br /> " .
     "Put it as the streamcookie argument to your tracer's requests to identify your obsel source.";

?>
				<br />
				<br />
				<div style="text-align:center;"><a href="../index.php">Index</a></div>
			</div>
		</div>
	</body>
</html>