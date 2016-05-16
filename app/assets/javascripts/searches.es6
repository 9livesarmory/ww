// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var map = '';


function initMap() {   //gmaps api
	geolocationChecker();
}

//----------------------------------------------

function geolocationChecker() { //browser geolocation data pull
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

	var lat = parseFloat(data.coords.latitude);
	var lng = parseFloat(data.coords.longitude);
	console.log(typeof lat);
	console.log(typeof lng);

	getLocation(lat,lng); //set lat and long into gmaps
}


function showPositionError(error) {
	console.log("Failed to get position :( ");
	console.log(error);
}


//------------------------------------------------


function getLocation(latitude,longitude) {//set geolocation data into gmaps
	var myLat = latitude;
	var myLng = longitude;
	var myLatLng = {lat: myLat, lng: myLng};
	console.log(myLatLng);
		createMap(myLatLng);
}


function createMap(myLatLng){  // Create a map object and specify the DOM element for display.
	map = new google.maps.Map(document.getElementById('map'), {
    	center: myLatLng,
    	scrollwheel: true,
    	zoom: 15
  	});
  	//locationPoints(locationSearch, map);
  	mapMarker(map,myLatLng);
}

// -------------------------------------------------------------------------------------

function mapMarker(map,myLatLng){  // Create a marker and set its position on gmaps
	var marker = new google.maps.Marker({
    	map: map,
    	position: myLatLng,
    	title: 'Washer!'
  });
}
//------------------------------------------

function locationCoordinates(locationSearch) { //google api to convert string address data into lat long coordinates

var coodinates = locationSearch;

	$.ajax ({
		type: "GET",
		url: `https://maps.googleapis.com/maps/api/geocode/json?address=${coodinates}`,
		success: function(coordData){
			console.log("success")
			console.log(coordData);
			var latitude = coordData.results[0].geometry.location.lat
			var longitude = coordData.results[0].geometry.location.lng
			getLocation(latitude,longitude);
		},
		error: function(error){
			console.log('error in locationCoordinates');
			console.log(error.responseJSON);
		}
	})
}


//------------------------------------------



function searchMap(){  //on submit callback function to kick everything off
	event.preventDefault();
	var locationSearch = $('.js-mapvalue').val();
	locationCoordinates(locationSearch);  //google api to convert string address data into lat long coordinates
	locationPoints(locationSearch); // internal rails call for existing location data
}


function locationPoints(locationSearch) { // internal rails call for existing location data
	var distanceSearch = 10;

	$.ajax ({
		type: "POST",
		url: "/api/search_merchants",
		data: {location: locationSearch, distance: distanceSearch},
		success: function(mapData){
			console.log("success")
			console.log(mapData);
			$('.js-merchantCard').empty();
			mapData.forEach(function (merchantObject) {
				//merchantObject.state
				//merchantObject.zipcode
				//merchantObject.city
				//merchantObject.street
				var merchant_id = merchantObject.id

				var lat = parseFloat(merchantObject.lat)
				var lng = parseFloat(merchantObject.lng)
				var myLatLng = {lat: lat, lng: lng};

				var html = `
				<a href="/${merchant_id}/order/new"><div class="js-singleMerchantCard">
					${merchantObject.first_name}
				</div></a>`;

				$('.js-merchantCard').append(html);

				mapMarker(map, myLatLng);
			})

			//getLocation(latitude,longitude);
	
		},
		error: function(error){
			console.log('error in SearchMap');
			console.log(error.responseJSON);
		}
	})
}
//------------------------------------------


// function openOrderForm() {

// }


//------------------------------------------

$( document ).ready(function() {

	$('.js-mapsearch').on('submit', searchMap); //on-submit callback for merchants
});

//--------------
