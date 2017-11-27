jQuery(document).ready(function($) {
	
document.addEventListener("turbolinks:load", function() {




	//alert('Jquery Loaded');

	$('#op').change(function(e) {
		$('#splash').css("opacity", $('#op').val());
	});

	$('.colorpicker').colorpicker();

	$('.colorpicker').on('changeColor', function(ev) {

		$('#clrbx').css("background-color", ev.color.toHex());
	});


    $('.colorpicker2').colorpicker();

    $('.colorpicker2').on('changeColor', function(ev) {

        $('#clrbx2').css("background-color", ev.color.toHex());
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

	$('#store_store_name').keyup(function () {
        if ($("#store_store_name").val().length < 3){
            $(".store_name_prev").html("<p style='color: red'>Must have at least 3 characters</p>");
        }else{
            $(".store_name_prev").html("");
        }
       store_check();
    });

    $('#store_email').keyup(function () {
        if (valmail($("#store_email").val())){
            $(".email_prev").html("");
        }else{
            $(".email_prev").html("<p style='color: red'>Not a valid email</p>");
        }
        store_check();
    });

    $("#store_password").keyup(function () {
        if ($("#store_password").val().length > 5){
            $(".pass_prev").html("");
        }else{
            $(".pass_prev").html("<p style='color: red'>Password must have at least 6 characters</p>");
        }
        store_check();
    });

    $("#store_password_confirmation").keyup(function () {

        pass_conf = $("#store_password_confirmation").val();
        passw = $("#store_password").val();
        if (pass_conf.length > 5 && passw == pass_conf){
            $(".pass_conf_prev").html("");
        }else{
            $(".pass_conf_prev").html("<p style='color: red'>Passwords dont match</p>");
        }
        store_check();
    });

	
	});

});

function store_check(){
   if($("#store_store_name").val().length > 2 && valmail($("#store_email").val()) && $("#store_password").val().length > 5 && $("#store_password_confirmation").val().length > 5 && $("#store_password_confirmation").val() == $("#store_password").val() ){
       $("#store_sign").removeAttr('disabled');
   }else{
       $("#store_sign").attr('disabled','disabled');
   }
}

function valmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (email.match(re)) {
        return true;
    } else {
        return false;
    }
}

function pass(pass) {
    var re = /^(?=.*[A-Z])(?=)(?=.*[0-9])(?=.).{6,}$/;
    if (pass.match(re)) {
        return true;
    } else {
        return false;
    }

}


