$(document).ready(function() {

	$('#offer_page').on('pageinit', function() {
		var width = $(window).width();
		$('ul').css('left', '0').css('width', width)
		$('li').css('width', parseFloat(width/5));
		$('img.footer_img').height('40px');
	});
});

