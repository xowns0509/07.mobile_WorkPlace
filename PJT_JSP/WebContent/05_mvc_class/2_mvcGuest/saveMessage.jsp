<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String projectName = "/JSP";
	//내 프로젝트 이름
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 남김</title>
</head>
<body>
  <font size="3" color="#bb44cc"> 방명록에 메세지를 남겼습니다. </font>
  <br />
  <br />
  <br />

  <a href="<%=projectName%>/SSyang.gc?cmd=list-page"> [ 목록보기 ]</a>
</body>
</html>