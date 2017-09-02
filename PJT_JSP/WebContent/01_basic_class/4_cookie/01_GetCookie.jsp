<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>쿠키</title>
</head>
<body>

  <h1>Cookie 정보 알아내기</h1>

  <h4>다음은 클라이언트 브라우저의 쿠키에서 얻어온 값 :</h4>
  <br>
  <br>

  <%
  	// 1. 클라이언트로부터 Cookie를 얻어옴.
  	//확인은 set쿠키 실행하여 id가 저장된 걸 확인

  	Cookie[] c = request.getCookies();
  	//쿠키즈로 복수임. 고로 배열로 받아야 함. 동시에 널값이 있을 수도 있기에 확인하는 거 작성해야 함.

  	for (int i = 0; c != null && i < c.length; i++) {
  		String cname = c[i].getName();

  		if (cname.equals("yourid")) {//yourid
  			out.print("당신의 ID는 " + c[i].getValue() + "입니다.");
  		}
  	}

  	// 2. 쿠키 이름 중에 "yourid"가 있다면 그 쿠키의 값을 출력
  %>

  <br>
  <a href="01_ChangeCookie.jsp"> 쿠키값 변경 </a>
  <br />
  <br>
  <a href="01_RemoveCookie.jsp"> 쿠키제거 </a>

</body>
</html>
