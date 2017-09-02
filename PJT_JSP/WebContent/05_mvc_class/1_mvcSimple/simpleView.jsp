<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//이전화면에서 넘어온 값을 받을 때
	String str = request.getParameter("name");

	//서버의 서블릿 측에서 넘어오는 값을 받을 때 쓰는 거. getAttribute
	Object obj = request.getAttribute("param");
  
  
  
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인이라네</title>
</head>
<body>



  <%=obj%>
  <br />
  <!--   절차를 타고 와야만 보여줘야 하는 페이지. URL(경로)을 다 감춰야하는거 -->
  복잡하다고 지나친 좌절과 놀람은 금물입니다.
  <br />
  <br />
  <img src="05_mvc_class/1_mvcSimple/imgs/sponge_1.JPG" />
  <br />
  <br />

</body>
</html>