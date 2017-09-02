<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String projectName = "/JSP";
	//내 프로젝트 이름
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 메인</title>
</head>
<body>
  메인화면이라 . . . 그냥 상상하고 . . .
  <a href="<%=projectName%>/SSyang.gc?cmd=list-page"> 방명록 </a>
  
  <!-- url을 통일. GuestControl도 되고(GuestControl?cmd=list-page)  -->
  <br />
  <br />
  <img src="imgs/image.gif">
  <br />
</body>
</html>