<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.beans.Member"%>
<%@ page import="member.beans.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	//화면에 출력되는 한글처리지 클라이언트가 입력한 한글처리는 안되는 거임.

	// (1) 이전 화면 폼에서 사용자가 입력한 값을 얻어오기
	Member m = new Member();
	m.setId(request.getParameter("id"));
	m.setPass(request.getParameter("pw"));
	m.setName(request.getParameter("name"));
	m.setAddr(request.getParameter("addr"));
	m.setTel(request.getParameter("tel"));

	// (2) 그 얻어온 값들을 DAO(모델단 클래스)로 넘기기.  

	// 1. 서버메모리에 단 하나만 띄우게 하려면 new를 못쓰게 하면 됨.
	// 우선 이런 걸 Singleton이라 함.
	//new를 못 쓰게 막으려면 생성자를 private 때리면 됨.
	//MemberDAO.java에 추가설명기술 계속됨.

	//MemberDAO dao = new MemberDAO();
	//int result = dao.insertMember(m);

	// 5.이제 MemberDAO의 객체는 생성자에 private를 때렸으니
	// 여기서(혹은 다른 모든 jsp) new MemberDAO(); 로 생성하지 못하며
	// 메모리에 단 하나만 올라오도록 되었다.

	// 6. new MemberDAO();로 객체를 생성하지 못한다면 방법은
	// 클래스명으로 객체를 생성할 수 밖에 없지.
	// 그런데 클래스명으로 객체를 생성하려면 static이어야 해.

	// 따라서...(MemberDAO.java에 추가설명기술 계속됨.)
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.insertMember(m);
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberForm.jsp</title>

<!-- 외부css연결. href로 삽입하고자 하는 css파일의 경로주기.
type="text/css". 텍스트형식의 css파일이란 뜻. -->
<!-- 점 하나(./)는 현재 디렉토리에서, 두 개(../)는 부모 디렉토리로 올라가는 거. -->
<link href="./css/myform.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	
</script>

</head>
<body>
  <%
  	if (result == 1) {
  %>
  회원가입이 되었습니다. 추카여.
  <%
  	} else {
  		response.sendRedirect("MemberForm.jsp");
  	}
  %>

  <!-- 데이터베이스에 이 내용을 담을 수 있는 테이블
  테이블명: memberTemp
  id varchar2(20)       PK
  password varchar2(20) NN
  name varchar2(20)     NN
  addr varchar2(100)
  tel  varchar2(20) -->
</body>
</html>
