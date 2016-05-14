// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $('.js-orderSelect-dropdown').material_select();

    $('.js-calcPrice').focusOut(showFinalPrice);
  });

function showFinalPrice (event) {
		var quantity = event.currentTarget;
		console.log(currentTarget);

	// if (bottom_total !== nil) {
	// 	bottom_total = parseInt($('#bottom_quantity').val());
	// }
	// else {
	// 	bottom_total=0;
	// }
	// tops_total = parseInt($('#top_quantity').val());
	// dresses_total = parseInt($('#dress_quantity').val());
	// totalprice = (bottom_total + tops_total + dresses_total);

	// var html = `
	// 			<div>
	// 				<h5>Total: ${totalprice}</h5>
	// 			</div>`;
	
	// $('.js-total-price').append(html);

}