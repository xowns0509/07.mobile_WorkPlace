/**
 * 
 */

$(function() {

	$('.accordion').each(function() {

		var dl = $(this);
		var allDt = dl.find('dt'); //dt를 전부 다 찾아내는거야. 다수니까 배열로 자동으로 자료형 설정되고
		var allDd = dl.find('dd');

		allDd.hide();
		allDt.css('cursor', 'pointer').click(function(){
			//전부 다 닫고
			allDd.slideUp();
			
			//클릭한 놈의 바로 다음 놈(dd)을 열어
			$(this).next().slideDown();
			$(this).css('cursor', 'default');

			
		});
		
	});

});