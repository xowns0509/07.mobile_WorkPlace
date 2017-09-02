<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>05_applicationParam</title>
</head>
<body>

  <h2>초기 파라메터</h2>
  아이디:
  <%=application.getInitParameter("DBuser")%><br />
  <!-- 처음부터 서버측에다 저장한 값을 얻어와. 설정파일(web.xml)에 기술된 내용들. -->

  패스워드:<%=application.getInitParameter("DBpass")%>
  <br />

</body>
</html>