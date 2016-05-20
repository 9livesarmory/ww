// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $('.js-orderSelect-dropdown').material_select();
    $('.js-quantity_validate').on('focusout', getFinalPrice);
    $('.completeOrder-btnStyle').on('click', completeOrder);
    // $('.stripe-button').data('amount');
  });

function getFinalPrice() {

	var quantity = event.currentTarget;
	console.log(quantity);

	var shirt_quantity = $('.topQuantity').val();
	var pants_quantity = $('.bottomQuantity').val();
	var onepiece_quantity = $('.onepieceQuantity').val();

	$.ajax ({
		type: "POST",
		url: "/api/item_prices",
		data: {shirtQuantity: shirt_quantity, pantsQuantity: pants_quantity, onepieceQuantity: onepiece_quantity},
		success: function(data){
			$('.js-total-price').empty();
			$('.js-stripe-price').empty();
			console.log("success")
			//console.log(data);

			var ordertotal = data;

			var html = `
				<div>
					<h5>$${ordertotal}</h5>
				</div>`;

			var stripePrice = ordertotal;

				$('.js-total-price').append(html);
				$('.stripe-button').data('amount').val(stripePrice);
		},
		error: function(error){
			console.log('error in itemprice');
			console.log(error.responseJSON);
		}
	})
}

function completeOrder() {

}


