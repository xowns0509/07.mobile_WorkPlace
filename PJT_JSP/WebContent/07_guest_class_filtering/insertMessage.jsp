<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">
// 	$(function() {
// 		$('#btn').click(function() {
// 			// 사용자의 입력값들을 1차적으로 브라우저에서 체크하는 곳 - Javascript or Jquery
			
			
// 			//document.frm.submit(); - name으로 찾기
// 			$('#frm').submit(); //- id로 찾기
// 		});
// 	});
</script>
</head>

<body>

  <form action="saveMessage.jsp" name="frm" id="frm" method="post">
    이름 : <input type="text" name="guestName" required />
    <br />
    <br />
    암호 : <input type="password" name="password" required />
    <br />
    <br />
    메세지 :
    <textarea name="message" rows="3" cols="30" required></textarea>
    <br />
    <br />
    <input id='btn' type="submit" value="메세지 남기기">
  </form>
</body>
</html>