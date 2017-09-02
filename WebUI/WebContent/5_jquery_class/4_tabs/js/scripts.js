/**
 * 
 */

$(function(){

	var topDiv = $('.tabSet');
	//var anchor = topDiv.find('a');
	//var anchor = topDiv.find('ul.tabs a');
	var anchors = topDiv.find('ul.tabs > li > a');
	
	var panelDivs = topDiv.find('.panel');
	
	//전에 뭘 눌렀는지를 알아두려면 저장해야 함
	var lastAnchor = anchors.filter('.on');
	var lastPanel = $( lastAnchor.attr('href'));
	
	anchors.show();
	panelDivs.hide();
	lastPanel.show();
//	
//	anchors.click(function (evt){
//		//a태그의 기능을 막아줘야 해. 그래서 a태그의 evt를 받어
//		evt.preventDefault(); //그 태그의 기존 고유의 기능을 막는 놈.
//		
//		var currentAnchor = $(this);
//		var currentPanel = $(currentAnchor.attr('href'));//지금 현재 클릭한 놈의 속성값 찾기
//		
//		//기존 last의 클래스를 제거해야 해.
//		lastAnchor.removeClass('on');//과거에 있는 놈의 on을 빼주고
//		currentAnchor.addClass('on');//클릭한 놈에게 on 클래스를 부여.
//		
//		//수진이꺼
//		//currentPanel.show();
//		//lastPanel.hide();
//		
//		lastPanel.slideUp();//사라지는 거
//		 
//		//그리고 지금 클릭한 놈을 last로 잡아줘야지.
//		lastAnchor = currentAnchor;
//		lastPanel = currentPanel;
//		
//		lastPanel.slideDown();//보여주는거
//		
//		
//		
//		
//	});
	
	// 버튼 눌렀을 때 해당되는 놈만 보이게 함.
	
	//find와 filter의 차이점
	
	
	$('.tabSet').tabs({
		active: 2,
		hide: true, //hide에다 true 주면 애니메이션 효과를 줌.
		heightStyle: 'auto'
	});
	
});