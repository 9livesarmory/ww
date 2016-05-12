// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initMap() {   //gmaps api
 	getLocation(); //set lat and long
 	createMap();  // Create a map object and specify the DOM element for display.
 	mapMarker(); // Create a marker and set its position.
}

//----------------------------------------------


function getLocation() {
	var myLatLng = {lat: 25.7735031, lng: -80.133472};
}


function createMap(){
	// Create a map object and specify the DOM element for display.
	var map = new google.maps.Map(document.getElementById('map'), {
    	center: myLatLng,
    	scrollwheel: true,
    	zoom: 15
  	});
}
	
function mapMarker(){
	// Create a marker and set its position.
	var marker = new google.maps.Marker({
    	map: map,
    	position: myLatLng,
    	title: 'Hello World!'
  });
}


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

				var html = `
				<li>
					${merchantObject.first_name}
				</li>`;
				$('.js-merchantDisplay').append(html);
			})

			//var lat = parseFloat(lat);
			//var lng = parseFloat(lng);

		},
		error: function(error){
			console.log('error in SearchMap');
			console.log(error.responseJSON);
		}
	})
}

//------------------------------------------

$( document ).ready(function() {

$('.js-mapsearch').on('submit', searchMap); //onclick callback
	
});
