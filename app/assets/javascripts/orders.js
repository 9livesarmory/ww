// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $('.js-orderSelect-dropdown').material_select();

    //$('.js-calcPrice').focusOut(showFinalPrice);
  });

// function showFinalPrice () {
// 		// var quantity = event.currentTarget;
// 		// console.log(currentTarget);

// 	// if (bottom_total !== nil) {
// 	// 	bottom_total = parseInt($('#bottom_quantity').val());
// 	// }
// 	// else {
// 	// 	bottom_total=0;
// 	// }
// 	// var top_quantity = parseInt($('#top_quantity').val());
// 	// var bottom_quantity = parseInt($('#bottom_quantity').val());
// 	// var dress_quantity = parseInt($('#dress_quantity').val());
// 	// var totalprice = (bottom_total + tops_total + dresses_total);
// 	var totalprice = 10;

// 	var html = `
// 				<div>
// 					<h5>Total: ${totalprice}</h5>
// 				</div>`;
	
// 	$('.js-total-price').append(html);

// }