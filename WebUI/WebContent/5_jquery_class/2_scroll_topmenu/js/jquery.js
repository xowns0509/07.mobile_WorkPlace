/**
 * 
 */

$(function(){
	$(window).scroll(function(){
		$('#navigation').css('top', $(document).scrollTop());		
	});
	

	//스크롤 내릴 때라는 이벤트를 걸어줘야 함.
	//그래야 스크롤 내릴때마다 위에 붙어있으므로 계속 따라오는 것 처럼 보이지.
});