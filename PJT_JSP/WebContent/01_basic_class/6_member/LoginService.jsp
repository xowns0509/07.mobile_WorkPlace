<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.beans.Member"%>
<%@ page import="member.beans.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	//화면에 출력되는 한글처리지 클라이언트가 입력한 한글처리는 안되는 거임.

	// (1) 이전 화면 폼에서 사용자가 입력한 값을 얻어오기
	Member m = new Member();
	m.setId(request.getParameter("User"));
	m.setPass(request.getParameter("Pass"));

	// (2) 그 얻어온 값들을 DAO(모델단 클래스)로 넘기기.  

	MemberDAO dao = MemberDAO.getInstance();
	String result = dao.showName(m);
	//로그인 실패하면 그냥 로그인창으로 리다이이렉트
%>
<!DOCTYPE html>
<html>
<head>
<title>로그인확인</title>
</head>
<body>
  <%
  	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
  	if (result != null) {

  		// #2. 세션에 "id"라는 이름에 변수 user 값을 저장
  		session.setAttribute("name", result);// 세션을 구성해줄려면 session만 써주면 되.

  		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청
  		response.sendRedirect("MainPage.jsp");
  	} else {

  		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청
  		response.sendRedirect("LoginForm.jsp");

  	}
  %>

</body>
</html>