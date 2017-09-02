<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인확인</title>
</head>
<body>
  <%
  	// 실제로는 DB에서 가져와야하는 값임. 아직 DB와 연결을 안 했으니
  	// 아래의 값들로 매칭하여 쿠키 생성여부를 결정.
  	String saveUser = "xowns";
  	String savePass = "1234";

  	// 이전화면 폼에서 넘겨받는 값
  	String user = request.getParameter("User");
  	String pass = request.getParameter("Pass");

  	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
  	if ((user.equals(saveUser)) && (pass.equals(savePass))) {

  		//#############
  		// 1. Cookie 객체 생성
  		Cookie cId = new Cookie("user", user);
  		//Cookie cId = new Cookie("user", "saveUser");
  		//Cookie cPw = new Cookie("pass", pass); 위에서 매칭했으니 굳이 클라이언트가 이걸 갖고 있을 필요가 없음
  		// 아니, 갖고 있으면 안됨. 보안의 위배
  		// 앞(yourid)이 이름 - 변수명 같은 거. 뒤에가 값 - 진짜 ID값.
  		// String name, String Value

  		// 2. 쿠키속성 지정 ( 속성 부여 ) 
  		cId.setMaxAge(1 * 60 * 60);//초 단위. 계산한 통짜 값(1시간 3600) 안넣고 이렇게 계산식 넣어서 주로 씀.
  		//cPw.setMaxAge(1 * 60 * 60);

  		// 3. 응답으로 쿠키전송. 클라이언트에게 전송하는 모든건 response.
  		response.addCookie(cId);
  		//response.addCookie(cPw);
  %>

  <h2>
    <%=user%>님, 성공적으로 로그인하셨슴다...
  </h2>

  <p>
    <a href="02_MainPage.jsp"> 들어가기 </a>

    <%
    	} else {
    %>
  
  <h2>로그인에 실패했슴다...</h2>
  <p>
    <a href="02_LoginForm.jsp"> 되돌아가기 </a>

    <%
    	}
    %>
  
</body>
</html>