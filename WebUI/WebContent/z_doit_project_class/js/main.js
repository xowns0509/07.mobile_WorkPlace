$(function() {

	/* 날짜 표기 */
	var today = new Date();
	$('.year').html(today.getFullYear());
	$('.month').text(today.getMonth() + 1);
	$('.date').text(today.getDate());

	// 0~9 까지(한 자리수)는 앞에 0나타나게 해주는 것. 자리수 맞출 때.
	// var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) :
	// '0'+(now.getMonth()+1);
	// var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

	/* 검색 창 안내 가이드 */
	$('#keyword').focus(function() {
		$(this).css("background-position", "0 -500px");
	});

	$('#keyword').blur(function() {
		$(this).css("background-position", "0 0");
	});

	/* 로그인 버튼 */
	$('.login_wrap img').click(function() {
		$('#login_f').animate({
			top : 20
		});
	});

	$('.login_close_btn img').click(function() {
		$('#login_f').animate({
			top : -500
		});
	});

	/* 탭메뉴 */
	// //예지꺼 버튼과 게시판 전환
	// prevDt = $("#tabmenu .tab_btn1");
	// prevImg = prevDt.find("img").attr("src");
	//
	// $("#tabmenu dt").each(function() {
	// var dt = $(this);
	//
	// var allDd = $("#tabmenu dd");
	// var currImg;
	// var tmp;
	//
	// // 탭을 클릭했을때
	// dt.find("img").click(function() {
	// // 자기 자신일때만 바꿔주지 말기
	// // 전 이미지 바꿔주기
	// tmp = prevImg.replace("_over.gif", "_out.gif");
	//
	// currImg = dt.find("img").attr("src"); // 현재 선택된 이미지
	// changeImg = currImg.replace("_out.gif", "_over.gif");
	//
	// // 선택되기 전 이미지
	// // 먼저 지워주고
	// allDd.css("display", "none");// 이미지 3개를 없애
	// dt.next().css("display", "block");// 다시 이미지 보여주는 거 div, 테이블에도 먹힘
	// prevDt.find("img").attr("src", tmp);
	// dt.find("img").attr("src", changeImg);
	//
	// prevImg = changeImg;
	// prevDt = dt;
	// });
	// });
	
	/* 연재꺼 베스트북 슬라이더 */
	var bx = $('#best_bg > ul').bxSlider({
		minSlides : 5,
		maxSlides : 5,
		slideMargin : 10, // 슬라이드 간격
		slideWidth : 120, // 슬라이드 넓이

		auto : true,
		speed : 500,
		moveSlides : 2,

		pager : false,
		controls : false,
		autoHover : true
	});

	$('.prev_btn').click(function() {
		bx.goToPrevSlide();
		return false; // <a> 태그의 링크 속성 차단
	});

	$('.next_btn').click(function() {
		bx.goToNextSlide();
		return false; // <a> 태그의 링크 속성 차단
	});

	/* 전체메뉴 */
	$('#total_btn').mouseover(function() {
		$('#total_menu').slideDown();
	});

	$('#total_close').click(function() {
		$('#total_menu').slideUp();
	});

//	/* 연재꺼 탭메뉴 전환. 실패. 따로 index.html건드려야 될듯 */
//	var topDiv = $('#tabmenu');
//	var anchors = topDiv.find('dt > a');
//	var panelDivs = topDiv.find('.panel');
//
//	var lastAnchor = anchors.filter('.on');
//	var lastPanel = $(lastAnchor.attr('href'));
//
//	anchors.show();
//	panelDivs.hide();
//	lastPanel.show();
//
//	anchors.click(function(evt) {
//		evt.preventDefault();
//
//		var currentAnchor = $(this);
//		var currentPanel = $(currentAnchor.attr('href'));
//
//		lastAnchor.removeClass('on');
//		currentAnchor.addClass('on');
//
//		lastPanel.hide();
//		currentPanel.show();
//
//		lastAnchor = currentAnchor;
//		lastPanel = currentPanel;
//
//		$('dt.tab_btn1 > a > img').attr("src",
//				$('dt.tab_btn1 > a > img').attr('src').replace("over", "out"));
//		$('dt.tab_btn2 > a > img').attr("src",
//				$('dt.tab_btn2 > a > img').attr('src').replace("over", "out"));
//		$('dt.tab_btn3 > a > img').attr("src",
//				$('dt.tab_btn3 > a > img').attr('src').replace("over", "out"));
//		$('a.on img').attr("src",
//				$('a.on img').attr('src').replace("out", "over"));
//		// 요약. 여기서 $(this)가 img를 뜻하는 게 아닌 듯. 그래서 자식으로 내려가야 함.
//
//		// $(this).attr("src", $(this).attr("src").replace("out", "over"));
//		// 위와 같이 쓰면 자꾸 "Uncaught Type Error: Cannot read property 'replace' of
//		// undefined" 가 뜸.
//		// 계속 원인을 찾다 우연히 위의 $(this)를 보니 44번째 코드행에 currentAnchor = $(this)가
//		// 기술되어있음.
//		// 생각해보니 $(this)는 img라고 생각했는데 내가 img를 currentAnchor에 저장할 리 없었음.
//		// Anchor는 $('#tabmenu dt > a ')로 img가 아니라 a태그였으니
//		// $(this)가 결국, 내가 쓰려던 $(this)가 아니라는 걸 알게 됨.
//		// $(this)의 사용은 포기, 활성화 된 버튼은 class가 on이란 걸 깨닫고
//		// a.on의 자식인 img를 찾아 거기서 replace를 구현.
//		// 승리.
//
//		return false;
//
//	});

	/* 실패. 탭메뉴 아이콘 전환 */
	// $('#tabmenu dt>a>img').each(function() {
	// $(this).mouseover(function() {
	// $(this).attr("src", $(this).attr('src').replace("out", "over"));
	// });
	//
	// $(this).mouseout(function() {
	// if ($(this).attr('src').filter(':contains(over)')) {
	// alert($(this).attr('src').filter(':contains(over)'));
	// }
	// alert($(this).attr('src'));
	// $(this).attr("src", $(this).attr('src').replace("over", "out"));
	// });
	// });
	
	
	/* 실패. 탭메뉴 게시판 전환 */
	// var lastPanel; //지금 현재 클릭한 놈의 속성값 찾기
	// $('#tabmenu').find('dt.tab_btn2 > a > img')
	//
	// $('#tabmenu dt>a>img').each(function() {
	// $(this).click(function() {
	//
	// //$('#tabmenu dt>a>img').attr("src", $('#tabmenu
	// dt>a>img').attr('src').replace("over", "out"));
	// $(this).attr("src", $(this).attr('src').replace("out", "over"));
	//
	// lastPanel.hide();
	// $(this).parent().parent().next().show();
	// lastPanel = $(this).parent().parent().next().show();
	//
	// });
	// });
	
	/* 내꺼 베스트북 슬라이더 */
	// var bx = $('#best_bg > ul').bxSlider({
	// //그림이 여러개가 있지만 처음 4개만 보고 싶으면
	// minSlides : 8,
	// maxSlides : 8,
	// slideMargin : 5, //슬라이드 간 간격
	// //slideWidth: 90, //슬라이드의 너비
	//
	// auto : true,
	// speed : 1800, //마지막 줄은 항상 콤마 없이
	// moveSlides : 1,
	//
	// pager : false, // 기본값이 true고 false면 밑의 동그라미버튼 사라짐
	// autoHover : true, //배너는 마우스 올리면 멈춰야 하잖아.
	// control : false
	// });
	//
	// $('.prev_btn').click(function() {
	// bx.goToPrevSlide();
	// return false; //<a>태그의 링크속성 차단시켜줌.
	// });
	//
	// $('.next_btn').click(function() {
	// bx.goToNextSlide();
	// return false; //<a>태그의 링크속성 차단시켜줌.
	// });
	
});

// 도움말
// 1. 날짜 구하기
// (1) Date 객체로 현재 날짜 구하기
// (2) 해당 위치를 찾아 글씨 출력 ( text() 함수 )
//	
// 2. 검색창 포커스
// (1) common.css를 확인하기
// #keyword{
// border:2px solid #d82824;height:27px;
// line-height:27px;width:295px;
// background:url("../images/sch_guide.gif") no-repeat;
// padding-left:5px;
// }
//		
// * "검색어를 입력하세요" 문구가 백그라운드 이미지임
//		
// => css 함수를 이용하여 css("background-position","0 -500px") 안보이게 했다가
// 다시 포커스를 잃으면 css("background-position","0 0")으로 보이게 한다.
//	

// 3. 로그인
// (1) common.css를 확인하기
// /* 로그인 영역 */
// .login_wrap{position:relative;}
// #login_f{
// width:305px;height:161px;background:url("../images/login_bg.png");
// position:absolute;left:-110px;
// top:-500px;z-index:15;padding:40px 0 0 30px;
// }
//
// => 위로 500px을 지정했기에 화면에 안 보이는 것임
//				
// (2) 로그인 버튼에 클릭 이벤트
//	
// 로그인 폼 영역을 찾아 보이게 ( animate() 이용하여 top 위치를 20px로 지정 )
//	
//			
// (3) 화면에 보이는 폼의 로그인 버튼에 클릭 이벤트
//	
// 로그인 폼 영역을 찾아 animate() 이용하여 top 위치를 -500px로 지정
//				
//
// 4. 전체메뉴 보이기
//
// 5. 탭메뉴
//
// 6. 베스트북 이미지 슬라이더 ( bxSlider 이용 )
