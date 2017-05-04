/*This is the js file for the index.html page*/
var im = 'http://www.robotwoods.com/dev/misc/bluecircle.png';
var home = 'http://www.iconhot.com/icon/png/token-dark/48/home-92.png';

function getlocation() {
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(initialize, showError);
	}
	else {
		console.log("Your browser does not support Geolocation.");
	}
}

function showError() {
	alert("Geolocation (the map application) does not work on insecure sites.");
}

function initialize(position) {
	var lat = position.coords.latitude;
	var lon = position.coords.longitude;
	var position = new google.maps.LatLng(lat, lon);
	var mapOptions = {
		zoom: 16,
		center: position,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
	}

	var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	var userMarker = new google.maps.Marker({
		position: position,
		map: map,
		icon: home,	
		title: "You are here!"
	});
}

