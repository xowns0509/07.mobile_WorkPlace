<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");

	// 2. 다시 화면으로 보낼 데이터 구성
	cate = "changed_" + cate + "_by_server";
	name = "from_" + name + "_server";

	// 3. 다시 파일을 호출
	//response.sendRedirect("00_normal_web.jsp?cate=" + cate + "&name=" + name);
	// 위에건 페이지 전환이라...
	out.write("cate=" + cate + "|name=" + name);//이런걸 cvs
%>
