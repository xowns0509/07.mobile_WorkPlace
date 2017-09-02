<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="info.beans.InfoBean"%>

<%
	// 	String name = request.getParameter("name"); //-----------------------------ㄱ<jsp:setProperty name="bean" property="name" />
	// 	String id = request.getParameter("id");// ------------------------------ setProperty 역할  <jsp:setProperty name="bean" property="id" />

	// 	InfoBean bean = new InfoBean(); //------------------------ useBean역할
	// 	bean.setName(name);
	// 	bean.setId(id);

	//jsp파일에서 가급적 자바코드 쓰지 말고 태그화 하자고...
%>

<!-- id는 주기 나름. 변수명 처럼 명칭임 -->
<jsp:useBean id="bean" class="info.beans.InfoBean" scope="application">
  <!-- scope="application" 추가. 이거 쓰는 일은 근데 별로 없음. -->
  <!-- scope="session" 근데 자주 끊어짐. 끊어진다는 건 못찾는다는 의미 -->
  <!-- scope 안쓰면 기본값은 scope="page" scope="request" -->
  <jsp:setProperty name="bean" property="name" /><!-- 이거 자체가 bean.setName(name);호출이  -->
  <jsp:setProperty name="bean" property="id" />
</jsp:useBean>
<%-- <jsp:setProperty name="bean" property="*" /> --%>
<!-- 별표 하나면 아이디 뿐만 아니라 이름, 성별 주소 등등을 일일히 줄 치지 않고 -->
<!-- 별 하나로 처리. -->


<!DOCTYPE html>
<html>
<body>
  <h2>당신의 신상명세서 확인</h2>
  이 름 :<%=bean.getName()%><!-- 옛날방식 -->
  <br />
  주민번호 :<jsp:getProperty name="bean" property="id" />
  <br />
  성 별 :
  <jsp:getProperty name="bean" property="gender" />
  <br />
  맞습니까????
</body>
</html>
