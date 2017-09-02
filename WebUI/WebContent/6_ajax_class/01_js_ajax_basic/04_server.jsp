<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");

	// 2. 다시 화면으로 보낼 데이터 구성
	String result = "";

	result += "{";
	result += "first: '변경된 값" + cate + "',";
	//쌍따는 자바꺼라서. 홑따는 문자열이라
	// 이거 안하면 alert은 뜨는데 텍필드에 데이터가 안들어옴
	// 이름:값 이름: 값
	result += "second:'" + name + "님 방가'";
	result += "}";

	out.write(result);
%>
