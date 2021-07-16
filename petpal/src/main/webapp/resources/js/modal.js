$(document).ready(function(){
    
  
    $('.container .row .d-grid .btn:first-child').click(function(){
        $('.modal_wrap').show();
        $('#sc_modal').show();
    });


    $('.modal_closebtn').click(function(){
        $(this).parent().hide();
        $('.modal_wrap').hide();
    });

    $('.choice_okbtn').click(function(){
        $('#sc_modal2').hide();
        $('.sc_modal_process').show();
    });

    $('.okbtn').click(function(){
        $('.sc_modal_process').hide();
        $('.content-info').find("input,li, div, a").prop("disabled",true);

    });

    $('.nobtn').click(function(){
        $('.sc_modal_process').hide();
        
    })

    $('.submit-box a').click(function(){
        $(this).parent().parent().hide();
        $('.modal_wrap').hide();
    });

   
        $("#time_btn").click(function(){
            // e.preventDefault();
        $('.tab>#tab2').show();
    });
        
    $('.content-info .content-btn1 a').click(function(){
        $('.modal_wrap').show();
        $('.sc_modal_process2').show();
       var orderCode2 = $(this).parent().parent().parent().children().find('#orderCode').val();
       
      	$("#code2").val(orderCode2);
    });

    
    $('.content-info .content-btn2 #btn_non').click(function(){
    	$('.modal_wrap').show();
    	$('.sc_modal_process3').show();
    	var orderCode3 =  $(this).parent().parent().parent().children().find('#orderCode').val();
    	var userId = $(this).parent().parent().parent().children().find('#userId').val();
    	
    	$('#code3').val(orderCode3);
    	$('#userId').val(userId);
    });
   


    $('.nobtn1').click(function(){
        $(this).parent().parent().hide();
        $('.modal_wrap').hide();
        
    });
});