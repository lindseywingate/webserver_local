/*This is the js file for the index.html page*/
var	directionDisplay;
var	directionsService = new google.maps.DirectionsService( );
var	map;

function initialize( ) {
	directionsDisplay = new google.maps.DirectionsRenderer( );
	var	GF = new google.maps.LatLng( 47.92525699999999, -97.032855 );
	var	mapOptions = {
		zoom: 14,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		center: GF
	}
	map = new google.maps.Map( document.getElementById('map_canvas'), mapOptions);
	directionsDisplay.setMap( map );
 }

function calcRoute( ) {
	var	start = document.getElementById('start').value;
	var	end	 = document.getElementById('end').value;
	var	request = {
		origin: start,
		destination: end,
		travelMode: google.maps.DirectionsTravelMode.WALKING
	};
	directionsService.route( request, function( response, status ) {
		if ( status == google.maps.DirectionsStatus.OK )
			directionsDisplay.setDirections( response );
		});
	}

