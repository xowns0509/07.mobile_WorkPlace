<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// ***  한글이 깨지는 문제가 있지만 전반적인 흐름만 이해합니다.
	request.setCharacterEncoding("utf-8");

	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");

	// 2. 다시 화면으로 보낼 데이터 구성
	//서버에서 변경된다는 신호를 주기 위해
	cate = "changed_" + cate + "_by_server";
	name = "from_" + name + "_server";

	// 3. 다시 파일을 호출
	response.sendRedirect("00_normal_web.jsp?cate=" + cate + "&name=" + name);
%>
