$(document).ready(function(){
    $('.time_list > ul > li > a').click(function(){
        $(this).parent().css('background','gray').siblings().css('background','none');
        var time = this.innerText;
        var orderCode = $(this).parent().parent().parent().parent().parent().siblings('#wrap').children().children().siblings('.right-con').children().siblings('main').children().siblings('.content-wrap')
        				.children().children().children().siblings('#orderCode').val();
       
        $("#selection").val(time);
        $("#deny").val(time);
        $(".code").val(orderCode);
        
        
        console.log(time);
    })

    $('.okbtn').click(function(){
    	var deny = $(this).parent().parent().siblings().children().children().siblings('#deny').val();

    	var orderCode1 = $(this).parent().parent().parents().children().siblings('#wrap').children().find('.content-wrap').find('#orderCode').val();

    	
    	$("#result").val(deny);
    	$("#code1").val(orderCode1);
    	
    	console.log(deny)
		
		$('.content-wrap > .content-info > div').css('');
		
		$('.content-wrap > .content-info > div input ').prop('disabled',true);
 

	
    });

    $('.sc_modal_process2 >.submit-box1 >.okbtn').click(function(){
    	var orderCode2 = 0;
    })
    
    
})