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



$(document).on('pageinit' ,'[data-role="page"]', function(){
	$('a').removeClass('ui-link');
	var page = '#' + $('[data-role="page"]').attr('id');
	if (page == '#signin_page')
		$.mobile.ajaxEnabled = false;
	else
		$.mobile.ajaxEnabled = true;
	
	var screenwidth = $(page).width();
	var windowWidth = $(window).width();
	if (screenwidth == null)
	{	
		screenwidth = windowWidth;
	}
		
	var reduce = function (width) {
		//$('.menusHorizontal > ul').width(width);
		$('.menusHorizontal > ul > li').width(120);
		if (width < 950)
		{
			$('div.mobile_header').show();
			$('.mobile_header').height('89');
			//alert("reduce");
			if (page == '#signin_page' || $('#logoutPressed').html() == 'yes')
			{	//alert("reduce");
				$('.mobile_header').height('213');
				$('#logoutPressed').html('no');
			}
			$('div.pc_header').hide();
			$('.pc_content').hide();
			$('.common_content').css('margin-top', -100);
			$('div.content').css('margin-top', 20);
			$('div#home_content').css('margin-top', 0);
			$('div.pc_footer').hide();
			$('.mobile_footer').show();
			$('div.mobile_footer > ul').css('left', '0').css('width', width);
			$('div.mobile_footer > ul > li').css('width', width/5);
			$(page).css('margin-left', 0).css('left', '0%');
		}
		else{
			$('.pc_content').show();
			$('.common_content').css('margin-top', -100);
			$('#home_content').css('margin-top', 30);
			$('div.content').css('margin-top', -10);
			$('div.pc_footer').show();
			$('.mobile_footer').hide();
			
			$(page).css('margin-left', 0).css('left', '0%');
			var sWidth = $(window).width();
			//$('.menusHorizontal > ul').width(width);
			if (sWidth/2 >= 475)
			{	
				$(page).css('margin-left', -width/2).css('left', '50%');
			}
			console.log(width/2);
		}
		
		
		
		//alert(width +'    ' + windowWidth);
		if (width <= 640) 
		{   
			$('.mobile_header').show();
			$('.pc_header').hide();
			$('.pc_content').hide();
			
			$('.content').css('margin-top', 10);
			//$('#home_content').css('margin-top', 100);
			if (width <= 500) {
				var w = width * 0.8;
				$('.common_content').css('margin-top', 100);
				$('#home_content').css('width', w);
			}
			$('.mobile_content').show();
			$('.field').attr('style', 'width:100px !important');
		}
		else
		{
			//alert(width);
			$('.pc_header').show();
			$('.mobile_header').hide();
			$('.mobile_header').height('0');
			$('.pc_content').show();
			$('.mobile_content').hide();
			$('.field').attr('style', 'width:200px !important');
			//$('#home_content').css('width', 400);

		}
		
		
	};
	
	reduce(screenwidth);
	
	$(window).resize(function () {
        var width = $(page).width();
		//var winWidth = $(window).width();
		if (width == null)
		{	
			width = 950;
		}
		
		//alert(width);
		reduce(width);
        
    });
	

	
	
	$(document).bind('mousemove', function (event) {
		$('.elementwidth').css('color', 'white');
        $('.elementwidth').html(event.pageX+ ',  ' + event.pageY);
    });
	
	
	alert($('#WCF_msg').html());

	
	
	
	$(document).on('click', "td.mark_as_read", function(){
		var page = $(this).children('p').html();
		var el = this;
		$.ajax({
			url: page,
			type: "get",
			cache: false,
			dataType: 'json',
			success: function(data) {
				$(el).parent().css('background' , 'rgba(243, 243, 243, 0.9)');
				//$(this).html('<img alt="Unread" src="/assets/read.png">')
				$(el).hide();

				var count = $('#unread_bulbs').html();
				
				$('#unread_bulbs').html(count-1);
				if (count>0){
					$('#home_notification img').attr('src', '/assets/greenlight.png');
				}
				else {
					$('#home_notification img').attr('src', '/assets/redlight.png');
				}
		
				//the value decreases on every click
				var sum_bulb = 	$('#unread_bulbs').html();
				if (sum_bulb == 0){
					$('#home_notification').html('<img alt="dark" height="31px" src="/assets/redlight.png" width="35px" />');
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("unsuccessful");
			}
		});
		
		
		
		
	});
	
	
	
	$(".menu-item-h a").mouseenter(function () {
        $(this).css('background', '#1B4D82');
        $(this).css("box-shadow", "inset 3px 3px 3px black");
    });



    $(".menu-item-h a").mouseleave(function () {
        $(this).css('background', 'linear-gradient(180deg, white, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82,#1B4D82)');
        $(this).css('box-shadow', '2px 2px 2px black');
    });

	
	
    $(".menu-item-h a").bind("click", function () {
        //$(".menusHorizontal").css('background', 'linear-gradient(180deg, white, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82, #1B4D82,#1B4D82)');
        //$(".menusHorizontal").css('box-shadow', '2px 2px 2px black');
        $('div.box').css('box-shadow', '0 0 20px #7FFF00');
        $(this).css('background', '#1B4D82');
        $(this).css("box-shadow", "inset 3px 3px 3px black");
    });
	
	
	$('.logout').bind('click', function(){
		$.mobile.ajaxEnabled = false;
		$('#logoutPressed').html('yes');
		alert("hello");
	});
	
	
	var orientation_change = function(width){
		if(width < 640 )
		{
			$('html, body').animate({scrollTop:0}, 'fast');
			width = $(window).width();
			$('ul').css('left', '0').css('width', width);
			$('li').css('width', width/5);
			$('img[src="header.jpg"]').height('80px');
			
			var window_width = $(window).width();
				
			//img_position = 0.5*window_width - 0.5*200;
			//14 is an some unknown constant added to the position to make it central
			//it is the difference between the programmatically calculate position and the actual postion
			$('#img').css('text-align', 'center');
			$('#store_img_pos').html('0px');
			//$('#img').css('left', (parseInt(img_position)-14) + 'px');
			$('#clublevelname').css('left' , '10px');
			$('#clublevelid').css('left' , '150px');

		  }
		  
		  else
		  {
			$('html, body').animate({scrollTop:0}, 'fast');
			width = $(window).width();
			$('ul').css('left', '0').css('width', width);
			$('li').css('width', width/5);
			
			
			
			var window_width = $(window).width();
				
			img_position = 0.5*window_width - 0.5*200;
			//14 is an some unknown constant added to the position to make it central
			//it is the difference between the programmatically calculate position and the actual postion
			$('#img').css('text-align', 'center');
			$('#store_img_pos').html('0px');
			//$('#img').css('left', (parseInt(img_position)-14) + 'px');
			$('#clublevelname').css('left' , '10px');
			$('#clublevelid').css('left' , '150px');
		  }
		  
	
	
	};
	
	
	
	$('#logout_div').bind('click', function(){
		//alert("logout");
		$.mobile.ajaxEnabled = false;
		$('#logoutPressed').html('yes');
	});





});







$(window).bind('orientationchange',function(e){

  if(window.orientation != 0)
  {
	$('html, body').animate({scrollTop:0}, 'fast');
    width = $(window).width();
	$('ul').css('left', '0').css('width', width);
	$('li').css('width', width/5);
	$('img[src="header.jpg"]').height('80px');
	
	var window_width = $(window).width();
		
	//img_position = 0.5*window_width - 0.5*200;
	//14 is an some unknown constant added to the position to make it central
	//it is the difference between the programmatically calculate position and the actual postion
	$('#img').css('text-align', 'center');
	$('#store_img_pos').html('0px');
	//$('#img').css('left', (parseInt(img_position)-14) + 'px');
	$('#clublevelname').css('left' , '10px');
	$('#clublevelid').css('left' , '150px');

  }
  
  else
  {
	$('html, body').animate({scrollTop:0}, 'fast');
    width = $(window).width();
	$('ul').css('left', '0').css('width', width);
	$('li').css('width', width/5);
	
	
	
	var window_width = $(window).width();
		
	img_position = 0.5*window_width - 0.5*200;
	//14 is an some unknown constant added to the position to make it central
	//it is the difference between the programmatically calculate position and the actual postion
	$('#img').css('text-align', 'center');
	$('#store_img_pos').html('0px');
	//$('#img').css('left', (parseInt(img_position)-14) + 'px');
	$('#clublevelname').css('left' , '10px');
	$('#clublevelid').css('left' , '150px');
  }
  
    //var orientation = window.orientation;
    //var new_orientation = orientation*-1;
    //$('body').css({
    //    "-webkit-transform": "rotate(" + new_orientation + "deg)"
    //});
  
});










