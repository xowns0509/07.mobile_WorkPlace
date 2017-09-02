<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리사이트</title>
</head>
<body>

  URL(경로)을 다 감추기 위해 이 곳은 시작하는 페이지.
  <br />
  <a href="simpleView.jsp">기존방식</a>
  <a href="/JSP/fish/fish1/fish2/fishall/sx.do">MVC 방식</a>
  <a href="/JSP/fish/fish1/fish2/fishall/sx.do?type=first">MVC 방식</a>

<%--   <%=projectName %> --%>
  <!-- 절대경로인 본인 프로젝트명... 경로는 상ㄴ관 없으나 마지막에 확장자로 .do로 끝나야함.
  그래야 simpleServlet을 불러오는 거. -->

</body>
</html>