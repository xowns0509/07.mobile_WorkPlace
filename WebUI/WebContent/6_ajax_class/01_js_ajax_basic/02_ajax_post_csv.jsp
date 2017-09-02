<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
	var xmlHttp;
	window.onload = function() {
		// 1. 브라우저에 따른 XMLHttpRequest생성하기.
		xmlHttp = new XMLHttpRequest();

		// 2. 요청에 대한 응답처리 이벤트 리스너 등록.
		xmlHttp.onreadystatechange = on_ReadyStateChange;

		// 3.서버로 보낼 데이터 생성.
		var data = "cate=book&name=honggil";

		// 3.데이터 생성.

		//###########################################################
		// 4. POST 방식으로 데이터 보내기, 응답은 비동기로 클라이언트<->서버간의 연결 요청준비.
		xmlHttp.open("POST", "02_server.jsp", true);
		// ? 하면 안되. url 타고 데이터 넘어가는 get 방식이 아니라서.
		//null 뜨는게 맞고 아래  더 추가 해야 함
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		// 5. 실제 데이터 전송.
		xmlHttp.send(data);

		//####			
		// T. 동기/비동기 실행 테스트를 위한 부분.
		alert("전송 시작!");
	}

	// 6.응답처리.
	function on_ReadyStateChange() {
		if (xmlHttp.readyState == 4) {
			//200: 에러없이 성공
			//500: 서버에러
			//404: 페이지 없을 때. 경로 없을 때
			if (xmlHttp.status == 200) {
				//alert("서버에서 받은 데이터:" + xmlHttp.responseText);

				// 7. 데이터 처리
				parseData(xmlHttp.responseText);

			} else {
				alert("처리 중 에러발생");
			}
		}
	}

	//#################################################
	//7. CSV포맷  데이터 처리.
	function parseData(strText) {
		var arrData = strText.split('|');//배열로 떨어짐
		for (var i = 0; i < arrData.length; i++) {
			var param = arrData[i].split('=');
			if (param[0].trim() == 'cate') {
				document.getElementById('cate').value = param[1];

			}
			if (param[0].trim() == 'name') {
				document.getElementById('name').value = param[1];

			}
		}

	}
</script>
</head>

<body>
  서버로부터 넘겨받은 데이터
  <br />
  첫번째 데이터 :
  <input type="text" name="" id="cate" />
  <br />
  두번째 데이터 :
  <input type="text" name="" id="name" />
  <br />
</body>
</html>


