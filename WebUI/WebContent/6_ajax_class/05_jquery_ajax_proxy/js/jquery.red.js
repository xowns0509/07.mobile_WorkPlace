/**
 * 	jquery.red.js
 */

$.fn.red = function(){
	// 여기 this는 jquery DOM객체이므로 this라고 사용
//	this.each( function(){
//			// each 내의 여기 this는 검색 대상 태그임으로 제이쿼리 $()안에 있어야 함
//		$(this).css("background","red");
//	});
	
	// this가 자체적으로 반복으로 수행하지만 헷갈리므로 위의 코드가 더 좋은가?
	this.css("background","red");
	
	return this;
}