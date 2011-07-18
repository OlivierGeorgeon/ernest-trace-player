<?php
require_once ('php/include/session.inc.php');
header("Content-type", "application/xhtml+xml");
echo '<?xml version="1.0" encoding="utf-8"?>';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<link rel="stylesheet" type="text/css" href="css/conf.css" />

<link rel="stylesheet" type="text/css" href="css/codemirror/codemirror.css" />
<link rel="stylesheet" type="text/css" href="css/codemirror/theme/default.css" />

<!-- <script type="text/javascript" src="js/lib/jquery-1.5.min.js"></script> -->
<script type="text/javascript" src="js/lib/jquery-1.5.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.xmldom-1.0.min.js"></script>
<script type="text/javascript" src="js/lib/jquery.tooltip.js"></script>
<script type="text/javascript" src="js/lib/pi.1.1.1.min.js"></script>
<script type="text/javascript" src="js/lib/pi.comet.1.2.js"></script>

<script type="text/javascript" src="js/misc.js"></script>
<script type="text/javascript" src="js/TracePlayer2.js"></script>
<script type="text/javascript" src="js/Player2.js"></script>
<script type="text/javascript" src="js/Displayer.js"></script>
<script type="text/javascript" src="js/AInInterpreter.js"></script>
<script type="text/javascript" src="js/StreamControler.js"></script>
<script type="text/javascript" src="js/SVGTrace.js"></script>
<script type="text/javascript" src="js/StreamSelector.js"></script>
<script type="text/javascript" src="js/ConfigEditor.js"></script>
<script type="text/javascript" src="js/FileLister.js"></script>
<script type="text/javascript" src="js/Editor.js"></script>

<script type="text/javascript" src="js/lib/codemirror/codemirror.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/xml/xml.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/clike/clike.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/php/php.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="js/lib/codemirror/mode/css/css.js"></script>
<!-- <script type="text/javascript" src="js/codemirror093/codemirror.js"></script>-->
<script type="text/javascript">
function init_start_player()
{
	$("#clear-notices").click(parametrizeCallback(function(e, noticeDiv)
			{
				noticeDiv.empty();
			},
			{args: [$("#my-player-thin-notices-div")]}
	));

<?php if(ICANHASFORMS) {?>
	configEditor = new ConfigEditor("config-editor", "my-player-thin-notices-div", "<?=dirname($_SERVER['SCRIPT_NAME'])?>");
<?php }else{?>
	configEditor = null;
<?php }?>
	streamSelector = new StreamSelector(
		"stream-selector", "my-player-thin-notices-div", "<?=dirname($_SERVER['SCRIPT_NAME'])?>",
		{
			div_id: "my-player-thin-div",
			notice_div_id: "my-player-thin-notices-div",
			pipeline: "pipeline"
		},
		configEditor
	);

	$("#clear-player").click(parametrizeCallback(function(e, streamSelector)
			{
				streamSelector.cleanPlayer();
			},
			{args: [streamSelector]}
	));
<?php if(ICANHASEDIT) {?>
	fileLister = new FileLister("lister-div", "editor-div", "<?=dirname($_SERVER['SCRIPT_NAME'])?>");
<?php }?>
}

function changeAutoStream(check)
{
	if(check.checked)
	{
		streamSelector.setAutoLast(true);
	}else{
		streamSelector.setAutoLast(false);
	}
}

$(document).ready(function()
{
	init_start_player();
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Trace player example</title>
</head>

<body>
	
	<!-- Top menu -->
	<div style="left: 0px; right: 0px; border: 1px solid gray; padding: 2px 7px 2px; margin-top: 5px">
		<a href="php/session/disconnect.php">Disconnect</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="php/session/changePassword.php">Change password</a> 
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="php/session/getCookie.php">My cookie</a>
	<?php if(ICANHASADMIN) {?>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="php/admin.php">Admin</a><?}?>
	</div>
	
	<!-- Trace display -->
	<div id="my-player-thin-div" style="top: 0px; position: relative"></div>
	
	<!-- Configuration forms -->
	<?php if(ICANHASFORMS) {?>
		<div style="display: table-cell" id="config-editor"></div>
	<?php }?>
	
	<!-- Trace list -->
	<div style="display: table-cell">
		<div style="display: block; border: 1px solid gray; padding: 7px; padding-top: 2px; margin: 1px 1px 1px 5px;">
			<div style="display: block; margin-bottom: 5px; color: gray">Chose the trace to stream</div>
			<div id="stream-selector"></div>
			<label><input name="auto-last" type="checkbox" autocomplete="off"
				onchange="changeAutoStream(this)" />Always play last</label>
		</div>
	</div>
	<br />
	
	<!-- Notification area -->
	<div style="display: block; position: absolute; z-index: -1; right: 0; margin-right: 2em; border: 1px solid gray">Information messages</div>
	<div style="font-size: 65%; height: 200px; right: 0; overflow: auto; border: 1px solid gray; background: rgba(255, 255, 255, 0.6);">
		<span id="my-player-thin-notices-div" style="background: rgba(255, 255, 255, 0.9)" />
	</div>
	<button id="clear-notices">Clear</button>
	<br />
	
	<!-- File edition area -->
	<?php if(ICANHASEDIT) {?>
		<div id="editor-div" style="border: 1px solid gray; padding: 7px; position: fixed; display: none; left: 10px; top: 10px; right: 10px; z-index: 2; background-color: #FFFFFF; opacity: 1"></div>
		<div style="border: 1px solid gray; padding: 7px; margin-top: 5px">
			<div style="display: block; margin-bottom: 5px; color: gray">Editable files</div>
			<div id="lister-div"></div>
		</div>
	<?php }?>

</body>
</html>
