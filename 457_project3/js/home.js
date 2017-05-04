function putgivetext() {
	var xmlhttp;
	if(window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if((xmlhttp.readyState==4) && (xmlhttp.status==200)) {
			document.getElementById("explanation_insert").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "js/givetext.txt", true);
	xmlhttp.send();
}
