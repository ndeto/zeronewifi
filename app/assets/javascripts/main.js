jQuery(document).ready(function($) {
	
	//alert('Jquery Loaded');

	$('#op').change(function(e) {

		$('#splash').css("opacity", $('#op').val());
	});

	$('.colorpicker').colorpicker();

	$('.colorpicker').on('changeColor', function(ev) {

		$('#clrbx').css("background-color", ev.color.toHex());
	});

	$("#color").click(function() {
		$(".back").css('display', 'none');
		$(".backcolor").css('display', 'block');
	});

	$("#back").click(function() {
		$(".back").css('display', 'block');
		$(".backcolor").css('display', 'none');
	});

	if ($('#color').is(':checked')) {
		
		$(".back").css('display', 'none');
		$(".backcolor").css('display', 'block');
		
	} else {
		
		$(".back").css('display', 'block');
		$(".backcolor").css('display', 'none');
		
	}

});
