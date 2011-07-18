<?php
require_once 'include/session.inc.php';
require_once 'include/user.inc.php';
require_once 'include/admin.inc.php';
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Administration</title>
		<script type="text/javascript" src="../js/lib/jquery-1.5.2.js"></script>
		<script type="text/javascript" src="../js/admin.js"></script>
		<script type="text/javascript">
			$(document).ready(onAdminReady);
		</script>
	</head>
	<body>
<?php

if(! ICANHASADMIN)
{
	die("You have not the right to rule here.</body></html>");
}

displayUserListForm();
?>	
		<br />
		<div style="text-align:center;"><a href="../index.php">Index</a></div>
	</body>
</html>