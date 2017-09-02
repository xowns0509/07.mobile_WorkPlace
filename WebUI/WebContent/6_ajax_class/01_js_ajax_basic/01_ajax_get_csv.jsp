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

		//콜백함수.
		//A라는 놈, B라는 놈
		// A에다 함수 만들어놓고 B가 A의 함수를 호출.
		// 자기자신은 호출하지 않은데 남이 날 불러줘.
		// B페이지에서 A페이지의 함수를 부르는 거임.

		// 2. 요청에 대한 응답처리 이벤트 리스너 등록.
		xmlHttp.onreadystatechange = on_ReadyStateChange;
		// 상태가 바뀔 때까지 기다리는 거. 
		//onreadystatechange 이게 이벤트인거야.
		// 밑에 응답처리의 함수(on_ReadyStateChange)와 연결시켜줬어

		// 3.서버로 보낼 데이터 생성.

		// 3.데이터 생성.
		var data = "cate=book&name=honggil";

		//###########################################################
		// 4. GET방식으로 데이터 보내기, 응답은 비동기로 클라이언트<->서버간의 연결 요청준비.
		xmlHttp.open("GET", "01_server.jsp?" + data, true);

		// 5. 실제 데이터 전송.
		xmlHttp.send(null);
		//get은 url로 보내는 거지, 바디로 보내는게 아니잖.
		//post라면 위의 null에 작성

		//####			
		// T. 동기/비동기 실행 테스트를 위한 부분.
		alert("전송 시작!");
	}

	// 6.응답처리.
	function on_ReadyStateChange() {
		// 4: 데이터전송완료(0-초기화전, 1-로딩중, 2-로딩됬을 때, 3-대화상태 일 때)
		// 완벽하게 뭔가 다 했을 때를 4번이라.
		// 1번은 모바일쪽에서 사용할 수 있음. 모바일은 유선보다 네트워크가 느리므로.
		// 아무때나 받으면 안되고 언제 받아야 하냐면
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

	//##################################################
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


