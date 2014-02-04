<?php 
require_once __DIR__ . '/../include/config.inc.php';

session_start();

// Defragments the database.
$db = new SQLite3(BASE_DATA_DIR . '/' . $_SESSION['cookie'] . '/trace_fragments.db');
$db->exec("VACUUM");

session_destroy();
header('Location: ' . $_SERVER['HTTP_REFERER'] );

?>