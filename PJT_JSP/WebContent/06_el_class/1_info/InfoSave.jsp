<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="info" class="info.beans.InfoBean">
  <jsp:setProperty name="info" property="name" />
  <jsp:setProperty name="info" property="id" />
  <jsp:setProperty name="info" property="*" />
</jsp:useBean>

<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>자료 출력</TITLE>
</HEAD>
<BODY>
  <H2>당신의 신상명세서 확인</H2>
  이 름 :
  <jsp:getProperty name="info" property="name" />
  <!-- getName함수 호출. -->
  <!-- 출력하기를 원하는  -->
  <%-- ${info.name} --%>
  <br />
  주민번호 :
  <%=info.getId()%>
  <%-- ${info.id} --%>

  <br />
  성 별 : ${info.gender}
  <!-- 이렇게 쓰는 거 자체가 get함수를 호출하는거라고. getGender()를. -->
  <!-- 그 프로퍼티, 즉 변수로 직접 접근하는 게 아니라 함수로 접근. -->
  <!-- 이런 식으로 썼을 때 완벽하게 자바코드를 뺄 수 있다는 거지. -->
  <br />
  맞습니까????
</BODY>
</HTML>