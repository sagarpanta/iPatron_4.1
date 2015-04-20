$(document).ready(function() {

	$(document).on('pageinit', '#notifications_page', function() {
		var width = $(window).width();
		$('ul').css('left', '0').css('width', width)
		$('li').css('width', parseFloat(width/5));
		$('img.footer_img').height('40px');
	});
});
