<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String guestName = request.getParameter("guestName");
	//id값을 폼테그 안에 어떻게 넣을까. hidden
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 삭제</title>
</head>
<body>
  <%=guestName%>님의 메세지를 삭제하려면 암호를 입력하세요.
  <br />
  <br />
  <form action="deleteConfirm.jsp" method="post">
    <input type="hidden" name="id" value="<%=id%>" />
    <br />
    암호 : <input type="password" name="password" /> <input type="submit" value="메세지 삭제" />
  </form>
</body>
</html>