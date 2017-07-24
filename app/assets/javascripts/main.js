jQuery(document).ready(function($) { 
	
	$('#op').change(function(e){
		
		
		$('#splash').css("opacity",$('#op').val());
	});
	
	$('.colorpicker').colorpicker();
	
	$('.colorpicker').on('changeColor', function(ev){
		
  $('#clrbx').css("background-color",ev.color.toHex());
});
	
	});