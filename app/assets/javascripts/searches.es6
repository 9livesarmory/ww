// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initMap() {   //gmaps api
	geolocationChecker();
}

//----------------------------------------------


function getLocation(latitude,longitude) {
	var myLat = latitude;
	var myLng = longitude;
	var myLatLng = {lat: myLat, lng: myLng};
	console.log(myLatLng);
		createMap(myLatLng);
}


function createMap(myLatLng){
	// Create a map object and specify the DOM element for display.
	var map = new google.maps.Map(document.getElementById('map'), {
    	center: myLatLng,
    	scrollwheel: true,
    	zoom: 15
  	});
  	mapMarker(map, myLatLng);
}
	
function mapMarker(map, myLatLng){
	// Create a marker and set its position.
	var marker = new google.maps.Marker({
    	map: map,
    	position: myLatLng,
    	title: 'Hello World!'
  });
}
//------------------------------------------

//------------------------------------------



function searchMap(){  // internal call for user location data
	event.preventDefault();
	var locationSearch = $('.js-mapvalue').val();
	var distanceSearch = 10;


	$.ajax ({
		type: "POST",
		url: "/api/search_merchants",
		data: {location: locationSearch, distance: distanceSearch},
		success: function(mapData){
			console.log("success")
			console.log(mapData);

			mapData.forEach(function (merchantObject) {
				//merchantObject.state
				//merchantObject.zipcode
				//merchantObject.city
				//merchantObject.street
				var lat = parseFloat(merchantObject.lat)
				var lng = parseFloat(merchantObject.lng)

				var html = `
				<li>
					${merchantObject.first_name}
				</li>`;
				$('.js-merchantDisplay').append(html);
			})

	
		},
		error: function(error){
			console.log('error in SearchMap');
			console.log(error.responseJSON);
		}
	})
}

//------------------------------------------

function geolocationChecker() {
	if ("geolocation" in navigator) {
		console.log("Geolocation is available");

		navigator.geolocation.getCurrentPosition(displayPosition,showPositionError);
	}

	else {
		alert("Oops, you don't have Geolocation. Time to upgrade your browser");
	}
}


function displayPosition (data){
	console.log("Got position");
	console.log(data);  //pull all data to analyze
	//console.log(data.coords.latitude);  pull latitude dataset to analyze
	//console.log(data.coords.longitude); pull longitude dataset to analyze

	//$(".js-set-lat").text(data.coords.latitude);
	//$(".js-set-long").text(data.coords.longitude);

	var lat = parseFloat(data.coords.latitude);
	var lng = parseFloat(data.coords.longitude);
	console.log(typeof lat);
	console.log(typeof lng);

	getLocation(lat,lng); //set lat and long
}


function showPositionError(error) {
	console.log("Failed to get position :( ");
	console.log(error);
}


//------

$( document ).ready(function() {


$('.js-mapsearch').on('submit', searchMap); //onclick callback
	
});

//--------------
