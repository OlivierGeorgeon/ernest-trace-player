<?php 
require_once 'include/session.inc.php';
require_once 'include/user.inc.php';

function checkBox($condition, $name)
{
	$condition = ($condition != 0);
	return '<input class="userright" type="checkbox" name="' . $name . '" autocomplete="off" ' . ($condition ? 'checked="checked"' : '') . ' />';
}

function displayUserListForm()
{
	$userInfos = getAllUsersInfos();
	
	echo "<table border=\"1\">\n";
	echo "	<tr>\n";
	
	echo "		<th>User name</th>\n";
	echo "		<th>Can use forms</th>\n";
	echo "		<th>Can use edition</th>\n";
	echo "		<th>Can use administration</th>\n";
	echo "		<th colspan=\"2\">Actions</th>\n";
	
	echo "	</tr>\n";
	foreach($userInfos as $user)
	{
		echo "	<tr class=\"user-row\">\n";
		
		echo "		<td> <input type=\"text\" name=\"username\" value=\"" . $user['username'] . "\" readonly=\"readonly\" /> </td>\n";
		echo "		<td> " . checkBox($user['icanhasforms'], "icanhasforms") . " </td>\n";
		echo "		<td> " . checkBox($user['icanhasedit'], "icanhasedit") . " </td>\n";
		echo "		<td> " . checkBox($user['icanhasadmin'], "icanhasadmin") . " </td>\n";
		echo "		<td> <button class=\"apply-user-change\">Apply</button> </td>\n";
		echo "		<td> <button class=\"delete-user\">Delete</button> </td>\n";
		
		echo "	</tr>\n";
	}
	echo "</table>\n";
}

?>
