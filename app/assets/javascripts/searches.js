// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initMap() {
  	var myLatLng = {lat: -25.363, lng: 131.044};

  	// Create a map object and specify the DOM element for display.
  	var map = new google.maps.Map(document.getElementById('map'), {
    	center: myLatLng,
    	scrollwheel: true,
    	zoom: 13
  	});

  	// Create a marker and set its position.
  	var marker = new google.maps.Marker({
    	map: map,
    	position: myLatLng,
    	title: 'Hello World!'
  });
}

$( document ).ready(function() {

	
});
