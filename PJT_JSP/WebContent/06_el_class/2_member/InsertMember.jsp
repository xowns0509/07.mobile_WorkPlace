<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.beans.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mem" class="member.beans.Member">
  <jsp:setProperty name="mem" property="*" />
</jsp:useBean>

<%
	MemberDAO memDao = MemberDAO.getInstance();
	memDao.insertMember(mem);
	//이거는 못빼고
%>

<!-- JSP를 왜 써? -->
<!-- DB연결하려고. 자바로 -->
<!-- 제어문. if for문을 html로 못해. -->

<!-- 그래서 위의 db연결하려는 부분은 어쩔 수 없이 적어줘야 해. -->
<!-- 그런데 제어문은 화면과 관련된 view와 관련이 있다. -->
<!-- 이것도 태그로 작성하려 함. 그것이 jstl -->

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
  <!-- EL로 화면출력 -->
  아이디:${mem.id}
  <br />
  패스워드:${mem.pass}
  <br />
  이름:${mem.name}
  <br />
  전화:${mem.tel}
  <br />
  주소:${mem.addr}
  <br />
</body>
</html>