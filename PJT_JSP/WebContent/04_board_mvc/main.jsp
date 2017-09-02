<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String projectName = "/JSP";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

body {
	text-align: center;
	font-family: 'Hanna', serif;
	font-size: 30px;
}
</style>
</head>
<body>
  <img src="imgs/board.JPG">
  <br />
  WELCOME 게시판 WORLD :)
  <a href="<%=projectName%>/BoardControl?cmd=list-page">게시판입장</a>
  <br />

</body>
</html>