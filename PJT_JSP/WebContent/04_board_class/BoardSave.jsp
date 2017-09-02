<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.model.*,board.service.*"%>

<%
	// 0. 넘겨받는 한글 깨지지 않도록 지정
	request.setCharacterEncoding("UTF-8");
%>

<!--  1. 전 화면 입력값을 넘겨받아 BoardRec 클래스의 각 멤버필드에 지정 -->
<!-- 자바빈즈태그(액션태그) 기술 -->
<!-- id는 곧 객체명! -->
<jsp:useBean id="boardRec" class="board.model.BoardRec">
  <jsp:setProperty name="boardRec" property="*" />
</jsp:useBean>

<%
	// 2. Service클래스에 write() 함수호출
	WriteArticleService.getInstance().write(boardRec);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글저장</title>
</head>
<body>
  입력되었는지 확인해보시구염...
  <br />
  만일 안되어도..환장하지 맙시다 !!! ^^
  <br />
  <br />
  <a href="BoardList.jsp"> [ 목록보기 ]</a>
</body>
</html>