<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	//--------------------------- 값 지정
	pageContext.setAttribute("name", "EOM1");// 한 페이지에 해당하는 범위를 담당.
	request.setAttribute("name", "TAEJOON1");// 하나의 리퀘스트에 해당
	session.setAttribute("name", "DOKDO_NOT"); // 세션 영역의 name란 영역에 dokdo를 넣음
	application.setAttribute("name", "KOREA_KOR");// 프로젝트 
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>첫번째 페이지</title>
</head>
<body>

  하나의 페이지 속성 :
  <%=pageContext.getAttribute("name")%>
  <br>
  하나의 요청 속성 :
  <%=request.getAttribute("name")%>
  <br>
  하나의 세션 속성 :
  <%=session.getAttribute("name")%>
  <br>
  하나의 어플리케이션 속성 :
  <%=application.getAttribute("name")%>
  <br>

  <!-- #############  -->
  <!-- 페이지 forward 이동된다면  -->
  <%--   <% --%>
  // response.sendRedirect("SecondPage.jsp");
  <%--   %> --%>
  <!-- 하나의 페이지 속성 : null  -->
  <!-- 하나의 이전의 페이지에 두었던 값이 못와. -->
  <!-- 하나의 요청 속성 : null  -->
  <!--   첫 번째 페이지와 두 번째 페이지 리퀘스트는 다름. 전혀 상관없는 별개의 jsp이므로. 그런데, -->
  <!-- 하나의 세션 속성 : DOKDO  -->
  <!-- 브라우저를 닫지 않는 이상 남아 있어. 다른 페이지로 넘어가도 당연히 남아있고 -->
  <!-- 하나의 어플리케이션 속성 : KOREA  -->
  <!--프로젝트를 통으로 저장할 수 있는. 프로젝트가 모두 사용할 수 있는.-->
<!--   어떤 객체를 어디다가 저장했을 때 언제까지 저장하는가 -->
  <jsp:forward page="SecondPage.jsp"></jsp:forward>

</body>
</html>