<?php
//This script logs in the users of the Roomfor website
//Cleaning input to avoid sql injections
$user = trim($_POST[username]);
$user = strip_tags($user);
$user = htmlspecialchars($user);

$pass = trim($_POST[password]);
$pass = strip_tags($user);
$pass = htmlspecialchars($user);

$username="lindseywingate";
$password="password";
$host="mysqldev.aero.und.edu";
$conn=mysql_connect($host, $username, $password);

if($conn) {
	echo "Successfully connected to MySQL!";
	mysql_select_db($conn, "lindseywingate");
	$query = "SELECT username, password from users WHERE username='$user' AND password='$pass'";
	$result = mysql_query($query);
	$count = mysql_num_rows($result);
	if($count!=0) {
		header('Location: ../home.html');	
	}
	else {
		header('Location: ../index.html');	
	}	

	mysql_close($conn);
}
else {
	die('Could not connect to MySQL: ' .mysql_error());
}


