/**
 * 
 */
// 우리스타보기의 테이블 중에서 짝수행의 배경변경.
// $(function() {
// $('table.data tbody tr:even').addClass('even').css('border',
// '3px solid cyan');
// });
//
// // 혹은
// $(function() {
// $('#celebs tbody tr:odd').css('background-color', '3px solid red');
// });
// var h = $('#here');
$(function() {

	// 작동 확인
	// $('#celebs tr').mouseover(function(){
	// $(this).addClass('td_mouseover');
	// });
	// $('#celebs tr').mouseout(function(){
	// $(this).removeClass('td_mouseover');
	// });

	//작동 확인
	$('#celebs tbody tr').hover(function() {//#celebs tr까지만 하면 
		$(this).addClass('td_mouseover');
	}, function() {
		$(this).removeClass('td_mouseover');
	});

	//작동 확인
	//	$('#celebs tr').mouseover(function() {
	//		$(this).css('background-color', 'purple');
	//	});
	//	$('#celebs tr').mouseout(function() {
	//		$(this).css('background-color', 'white');
	//	});

	$('#hideButton').click(function() {
		$('#intro img').slideUp(1500);
	});

	$('#showButton').click(function() {
		$('#intro img').fadeIn(1500);
	});
	
	//작동실패
	$('#toggleButton').click(function() {
		$('#intro img').toggle(function(){
			$('#intro img').fadeOut(1500);
		}, 2000, function() {
			$('#intro img').fadeIn(1500);
		});
	});
	
	//작동 확인
//	$('#toggleButton').click(function() {
//		if($('#intro img').is(':visible')){
//			$('#intro img').slideUp(1000);
//		}else{
//			$('#intro img').slideDown(1000);
//		}
//	});
//	
//	$('#toggleButton').toggle(function() {
//		
//	}, toggle();
//		
//	});
	
});

// 테이블에 마우스가 올라가면 색깔이 강조.
// td_mouseover css의 class 에 추가.
// 마우스가 테이블을 벗어나면 색깔이 원래대로.
// class를 제거
