<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>우리 페이지</title>
</head>
<body>

  <%
  	//##########
  	// 1. 요청을 통해 전송된 쿠키들을 얻어오기
  	// 2. 내가 지정한 이름의 쿠키를 찾기
  	// 3. 해당하는 그 쿠키의 값을 얻어와 변수에 저장

  	//쿠기를 갖고 왔는데 쿠키가 없으면... 이 페이지가 절대 뜨면 안되.
  	String id = null;
  	Cookie[] c = request.getCookies();
  	for (int i = 0; c != null && i < c.length; i++) {
  		if (c[i].getName().equals("user")) {//user라는 쿠키가 있는지 검색.
  			id = c[i].getValue();
  		}
  	}

  	if (id == null) {
  		response.sendRedirect("02_LoginForm.jsp");
  	}
  %>

  <h2>이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다</h2>
  <br />
  <br />
  <br />

  <%=id%>님, 로그인 중입니다.




</body>
</html>