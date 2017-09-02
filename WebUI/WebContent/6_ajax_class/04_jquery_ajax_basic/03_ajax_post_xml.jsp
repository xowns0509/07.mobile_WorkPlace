<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="libs/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var param = {
			cate : 'book',
			name : 'hong'
		};
		$.get("03_server.jsp", param, parseData);
		//$.get("03_server.jsp", param, parseData, "xml");//xml로 받게다하면 이렇게.
		alert('전송시작');
	});

	function parseData(xmlInfo) {
		$('#cate').val($(xmlInfo).find('first').text());
		$(xmlInfo).find('first').text();
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


