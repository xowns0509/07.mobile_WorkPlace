<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>쿠키</title>
</head>
<body>

  <b>Simple Cookie Example</b>
  <hr>

  <%
  	// 1. 클라이언트로부터 Cookie를 얻어옴 
  	// 2. 쿠키 이름 중에 "yourid"가 있는지 검색
  	// 3. 해당하는 쿠키가 있다면 그 이름으로 새 쿠키를 만들고 유효시간을 0으로 지정하고 전송

  	//   쿠키를 제거하는 함수가 따로 존재하지 않으므로
  	// setMaxAge를 0으로 때려버림.

  	// 1. Cookie 객체 생성
  	Cookie[] c = request.getCookies();

  	for (int i = 0; c != null && i < c.length; i++) {
  		String cname = c[i].getName();

  		if (cname.equals("yourid")) {
  			Cookie newc = new Cookie("yourid", "");

  			newc.setMaxAge(0);
  			//쿠키를 새로 만들어 유효시간을 0으로 만든건 서버.
  			//서버가 새로운 쿠키를 만들었으니
  			//그 유효시간이 0인 쿠키를 클라에 다시 전달해야 함.(덮어씌움)
  			response.addCookie(newc);

  		}
  	}
  %>
  <br>

  %>


  <br>
  <a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body>
</html>