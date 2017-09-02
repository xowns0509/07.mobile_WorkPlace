<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- contentType="text/xml"이다. xml로 넘겨받아야 할 때는. 서버 쪽인 server.jsp만-->

<%
	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");

	// 2. 다시 화면으로 보낼 데이터 구성
	String result = "";
	result += "<data>";
	result += "<first> 서버에서" + cate + "에서 변경.</first>";
	result += "<second> 저는" + name + "입니다.</second>";
	result += "</data>";

	out.write(result);
%>
