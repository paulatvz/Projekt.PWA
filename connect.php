<?php
header('Content-Type: text/html; charset=utf-8');

$servername = "localhost";
$username = "root";
$password = "";
$database = "vijesti_db";
$port = 3307;

$dbc = mysqli_connect($servername, $username, $password, $database, $port) or die('Error connecting to MySQL server: ' . mysqli_connect_error());

mysqli_set_charset($dbc, "utf8");

?>