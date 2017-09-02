<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 쿠키란 웹브라우저(클라이언트)에 문자열로 저장하는 것
(기본은 메모리저장이지만 속성을 부여하면 화일로도 저장.) -->

<html>
<head>
<title>쿠키</title>
</head>
<body>

  <b>Simple Cookie Example</b>
  <hr>

  <%
  	// 1. Cookie 객체 생성
  	Cookie c = new Cookie("yourid", "silvina");

  	// 2. 속성 부여
  	c.setMaxAge(1 * 60 * 60);//초 단위. 계산한 통짜 값(1시간 3600) 안넣고 이렇게 계산식 넣어서 주로 씀.

  	// 3. 클라이언트에 쿠키 전송. 클라이언트에게 전송하는 모든건 response.
  	response.addCookie(c);
  %>

  <a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body>
</html>