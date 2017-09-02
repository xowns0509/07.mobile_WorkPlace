<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 세션은 아예 내장객체? -->
<!-- 엄밀하게 말하면 자바에서 선언한 변수라 아니긴 한데 -->
<!-- jsp에서 막갖다 쓰니 그러는 것 처럼 보임. -->

<!-- setAttribute() 리턴형:  void -->
<!-- getAttribute() 리턴형: Object  -->
<!-- removeAttribute() //세션을 하나 지움(장바구니만 비우고 싶을 때.) -->
<!-- invalidate()    //아예 세션 날려버림 -->
<!-- (로그아웃. 장바구니를 포함, 로그인 했던 정보를 모두 날리고 싶을 때) -->

<%
	//# 1."id"로 저장된 세션값을 얻어온다.
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	//# 3. null이 아니라면 String 형변환하여 변수에 지정

	// String id = (String)session.getAttribute("login");
	// 받은 걸 무턱대고 string으로 형변환 말고
	// 우선 오브젝트로 받은 후 null이 아닌 경우에 처리해줘야 함.
	Object id = session.getAttribute("login");
	if (id == null) {
		response.sendRedirect("LoginForm.jsp");
		return;

	}
%>

<!DOCTYPE html>
<html>
<head>
<title>우리 페이지</title>
</head>
<body>
  <center>
    <h2>이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다</h2>
    <br />
    <br />
    <br />
    <%=id.toString()%>님, 로그인 중입니다.

  </center>
</body>
</html>