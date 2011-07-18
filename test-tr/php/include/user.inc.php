<?php 
require_once __DIR__ . '/misc.inc.php';

function hashPassword($username, $password)
{
	return sha1($password);
}

function getUserDB()
{
	global $userDB;
	if(!isset($userDB))
	{
		$userDB = new SQLite3(BASE_DATA_DIR . '/users.db');
		$userDB->exec("CREATE TABLE IF NOT EXISTS users (username VARCHAR(255) PRIMARY KEY, password CHAR(40), cookie CHAR(30), creation_date DATE, icanhasforms BOOLEAN, icanhasedit BOOLEAN, icanhasadmin BOOLEAN);");
	}
	return $userDB;
}

function userDBClose()
{
	global $userDB;
	if(isset($userDB))
	{
		$userDB->close();
	}
}

function newUser($username, $password, $cookie = false)
{
	$db = getUserDB();
	$username = $db->escapeString($username);
	$password = hashPassword($username, $password);
	$cookie = $cookie !== false ? $cookie : getRandomString(30);
	return @($db->exec("INSERT INTO users (username, password, cookie, creation_date, icanhasforms, icanhasedit, icanhasadmin) SELECT '$username', '$password', '$cookie', datetime('now'), 0, 0, CASE WHEN count(*) > 0 THEN 0 ELSE 1 END FROM users;"));
	//return @($db->exec("INSERT INTO users VALUES('$username', '$password', '$cookie', datetime('now'), 0, 0, 0);"));
}

function deleteUser($username)
{
	$db = getUserDB();
	$username = $db->escapeString($username);
	return @($db->exec("DELETE FROM users WHERE username='$username';"));
}

function deleteTemporaryUsers()
{
	$db = getUserDB();
	return @($db->exec("DELETE FROM users WHERE username LIKE 'guest-%' AND datetime(creation_date) < datetime('now', '-1 days');"));
}

function getUserInfos($username, $password)
{
	$db = getUserDB();
	$username = $db->escapeString($username);
	$password = hashPassword($username, $password);
	$userInfos = @($db->querySingle("SELECT * FROM users WHERE username='$username' AND password='$password';", true));
	
	return $userInfos;
}

function getAllUsersInfos($limit = 30, $offset = 0)
{
	$db = getUserDB();
	$userInfos = @($db->query("SELECT * FROM users ORDER BY ROWID LIMIT $limit OFFSET $offset;"));
	
	return copyResultSet($userInfos);
}

function userSetRights($username, $ichForms, $ichEdit, $ichAdmin)
{
	$db = getUserDB();
	$username = $db->escapeString($username);
	$ichForms = $ichForms ? '1' : '0';
	$ichEdit = $ichEdit ? '1' : '0';
	$ichAdmin = $ichAdmin ? '1' : '0';
	return @($db->exec("UPDATE users SET icanhasforms=$ichForms, icanhasedit=$ichEdit, icanhasadmin=$ichAdmin WHERE username='$username';"));
}

function userSetPassword($username, $newPassword)
{
	$db = getUserDB();
	$username = $db->escapeString($username);
	$password = hashPassword($username, $newPassword);
	return @($db->exec("UPDATE users SET password='password' WHERE username='$username';"));
}

?>
