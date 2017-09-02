$(function() {
	$('p#intro').animate({
		padding : '20px',
		fontSize : '20px'
	}, 2000);
	// p태그가 갖고 있는 id: 인트로 라는 놈을 찾아.
	// p태그가 여러개 있을 수도 있으니까.

	$('#navigation li').hover(function() {
		$(this).animate({paddingLeft : '+=20px'} , 1000);
	}, function() {
		$(this).animate({paddingLeft : '-=20px'} , 1000);
	});
	

//		$('.accordion').each(function() {
//
//		var dl = $(this);
//		var allDt = dl.find('dt'); // dt를 전부 다 찾아내는거야. 다수니까 배열로 자동으로 자료형 설정되고
//		var allDd = dl.find('dd');
//
//		allDd.hide();
//		allDt.css('cursor', 'pointer').click(function() {
//			// 전부 다 닫고
//			allDd.slideUp();
//
//			// 클릭한 놈의 바로 다음 놈(dd)을 열어
//			$(this).next().slideDown();
//			$(this).css('cursor', 'default');
//
//		});
//
//	});
	
	
	$('#bio div').slideUp();
	$('#bio h3').click(function() {
		$(this).next().animate({ 'height' : 'toggle' } , 1000, 'easeOutBounce');
	});
	
})