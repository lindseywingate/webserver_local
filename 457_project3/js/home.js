function putneedtext() {
	var xmlhttp:
	if(window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if((xmlhttp.readyState==4) && (xmlhttp.status==200)) {
			document.getElementById("explanation_insert").innerHTML=xml.http.responseText;
		}
	}
	xmlhttp.open("GET", "needtext.txt", true);
	xmlhttp.send();
}

function putgivetext() {
	var xmlhttp:
	if(window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if((xmlhttp.readyState==4) && (xmlhttp.status==200)) {
			document.getElementById("explanation_insert").innerHTML=xml.http.responseText;
		}
	}
	xmlhttp.open("GET", "givetext.txt", true);
	xmlhttp.send();
}
