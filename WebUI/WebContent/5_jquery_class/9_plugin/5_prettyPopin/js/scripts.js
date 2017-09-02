/**
 * 
 */

$(function (){
	$('a[rel = "prettyPopin"]:eq(0)').prettyPopin({
		//a태그 중 rel속성 갖고 있고 그 속성이 prettyPopin인 놈... 중에 :eq[0]이므로 0번째
		width: 550
	});
	
	$('a[rel = "prettyPopin"]:eq(1)').prettyPopin({
		width: 800,
		
		//닫았을 때 무언가를 동작시키고프다면
		//끝난다음에 뭔가 처리하고 플 때.
		callback : function(){
			alert('closed');
		}
	});
	
	
});