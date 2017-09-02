<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="libs/jquery-1.9.1.min.js">
	
</script>
<script>
	$(function() {
		var param = {
			cate : 'book',
			name : 'hong'
		};
		$.post("04_server.jsp", param, parseData) //3번째 인자. 연결되는 함수
		alert('전송시작');
	});

	function parseData(resData) {
		var objResult = {};
		objResult = eval("(" + resData + ")");
		$('#cate').val(objResult.first);
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


