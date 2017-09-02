<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="member.beans.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  1. 자바소스
  <br />
  <%
  	Member m = new Member();
  	m.setName("홍길자");
  	m.setAddr("판교");
    // 나중에 액션태그로 설정 가능
  %>

  이름:
  <%=m.getName()%><br />
  주소:
  <%=m.getAddr()%><br />
  <br />


  2.JSTL 변수선언
  <br />
  <c:set var="name1"><%=m.getName()%></c:set>
  <!-- 윗 값은 텍스트노드가 되고 밑의 값은 어트리뷰트가 되지. -->
  <c:set var="name2" value="<%=m.getName()%>"></c:set>
  이름1: ${name1}
  <br />
  이름2: ${name2}
  <br />
  <br />


  * 아랫것과 비교
  <br />
  <c:set var="addr1">${m.addr}</c:set>
  <c:set var="addr2" value="${m.addr}" />
  이름1: ${addr1}
  <br />
  이름2: ${addr2}
  <br />
  <br />


  * 주의 -------------- --------------
  <br />
  <c:set var="m2" value="<%=m%>" />
  <c:set var="addr1">${m2.addr}</c:set>
  <c:set var="addr2" value="${m2.addr}" />
  이름1: ${addr1}
  <br />
  이름2: ${addr2}
  <br />
  <br />


  3. JSTL에서 setter 사용하려면
  <br />
  <c:set var="m3" value="<%=m%>" />
  <c:set target="<%=m%>" property="name" value="홍길동" />
  <c:set target="${m3}" property="addr" value="서울" />
  이름: ${m3.name}
  <br />
  주소: ${m3.addr}
  <br />
  <br />
  이름: ${m.name}
  <br />
  주소: ${m.addr}
  <br />
  <br />
  이름: <%= m.getName() %>
  <br />
  주소: <%= m.getAddr() %>
  <br />
  <br />
  
  
</body>
</html>