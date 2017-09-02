<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String[] hobby = request.getParameterValues("hobby");
	String hobbyStr = "";
  
	if (hobby != null) {
		for (int i = 0 ; i < hobby.length; i++) {
			hobbyStr += hobby[i] + ", ";
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>폼의 입력값 처리</title>
</head>
<body>
  <h2>폼의 입력값 넘겨받아 처리</h2>
  <br /> 입력한 이름 :
  <%=name%>
  <br /> 입력한 성별 :
  <%=gender%>
  <br /> 입력한 직업 :
  <%=occupation%>
  <br /> 입력한 취미 :
  <%=hobbyStr%>

</body>
</html>