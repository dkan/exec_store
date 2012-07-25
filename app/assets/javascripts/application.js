// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_self
//= require fancybox


$(function() {
	Stripe.setPublishableKey('pk_dMC5Q71uZTQvi4ievlGkrki0h62aw');
	$('form#new_order').submit(function(){
				
		$('#submit-button').attr("disabled", "disabled");
   		
		Stripe.createToken({
            number: $('#card_number').val(),
            cvc: $('#card_code').val(),
            exp_month: $('#card_month').val(), 
            exp_year: $('#card_year').val()
		}, function(status, response){
			$('#submit-button').removeAttr("disabled");
			$('#order_stripe_token').val(response.id);
			$('form#new_order').get(0).submit();
		})
		return false;
	})
	
})

$(document).ready(function(){
	$("a.fancybox").fancybox({
		'type': 'image',
		'transitionIn' : 'elastic',
		'transitionOut' : 'elastic',
		'speedIn' : 300,
		'speedOut' : 200
		});
});

$(document).ready(function() {
	$('#green').click(function(){
		$('#hoodie_color1').val('Green');
		resetPrimaryImages();
		$("#greenimg").attr('src',"./assets/greenactive.png");
	})

	$('#blue').click(function(){
		$('#hoodie_color1').val('Blue');
		resetPrimaryImages();
		$("#blueimg").attr('src',"./assets/blueactive.png");
	})

	$('#red').click(function(){
		$('#hoodie_color1').val('Red');
		resetPrimaryImages();
		$("#redimg").attr('src',"./assets/redactive.png");
	})

	$('#yellow').click(function(){
		$('#hoodie_color1').val('Yellow');
		resetPrimaryImages();
		$("#yellowimg").attr('src',"./assets/yellowactive.png");
	})

	$('#black').click(function(){
		$('#hoodie_color1').val('Black');
		resetPrimaryImages();
		$("#blackimg").attr('src',"./assets/blackactive.png");
	})
})

var resetPrimaryImages = function(){
	$("#greenimg").attr('src',"./assets/green.png");
	$("#blueimg").attr('src',"./assets/blue.png");
	$("#redimg").attr('src',"./assets/red.png");
	$("#yellowimg").attr('src',"./assets/yellow.png");
	$("#blackimg").attr('src',"./assets/black.png");
}

$(document).ready(function() {
	$('#green2').click(function(){
		$('#hoodie_color2').val('Green');
		resetSecondaryImages();
		$("#greenimg2").attr('src',"./assets/greenactive2.png");
	})

	$('#blue2').click(function(){
		$('#hoodie_color2').val('Blue');
		resetSecondaryImages();
		$("#blueimg2").attr('src',"./assets/blueactive2.png");
	})

	$('#red2').click(function(){
		$('#hoodie_color2').val('Red');
		resetSecondaryImages();
		$("#redimg2").attr('src',"./assets/redactive2.png");
	})

	$('#yellow2').click(function(){
		$('#hoodie_color2').val('Yellow');
		resetSecondaryImages();
		$("#yellowimg2").attr('src',"./assets/yellowactive2.png");
	})

	$('#pink2').click(function(){
		$('#hoodie_color2').val('Pink');
		resetSecondaryImages();
		$("#pinkimg2").attr('src',"./assets/pinkactive.png");
	})
	$('#purple2').click(function(){
		$('#hoodie_color2').val('Purple');
		resetSecondaryImages();
		$("#purpleimg2").attr('src',"./assets/purpleactive2.png");
	})
})

var resetSecondaryImages = function(){
	$("#greenimg2").attr('src',"./assets/green2.png");
	$("#blueimg2").attr('src',"./assets/blue2.png");
	$("#redimg2").attr('src',"./assets/red2.png");
	$("#yellowimg2").attr('src',"./assets/yellow2.png");
	$("#pinkimg2").attr('src',"./assets/pink2.png");
	$("#purpleimg2").attr('src',"./assets/purple2.png");
	}
