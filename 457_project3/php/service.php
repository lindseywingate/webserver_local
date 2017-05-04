<?php
//This script redirects people from the start page to the page they need
if(isset($_POST['radio1']) && ($_POST['radio1']) == "need") {
	header("Location: localhost/map.html");
}
if(isset($_POST['radio2']) && ($_POST['radio2']) == "give") {
	header("Location: localhost/donatespace.html");
}

?>
