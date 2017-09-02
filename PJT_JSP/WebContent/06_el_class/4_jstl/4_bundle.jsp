<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt는 format의 약자 -->

<!-- 언어설정. language 바꾸기 -->
<fmt:setLocale value="ko" />
<fmt:bundle basename="resource.message">
  <fmt:message key="TITLE" var="title" />
  <!DOCTYPE html>
  <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
</head>
<body>

  <fmt:message key="GREETING" />
  <br />
  <br />
  <hr />

  <c:if test="${empty param.name }">
    <fmt:message key="NAME">
      <fmt:param value="${param.name }">
      </fmt:param>
    </fmt:message>

  </c:if>
  <!-- param에 name이 비어있다면... 반대는 !empty param.name -->

  <!--   meta-inf, web-inf는 사용자가 접근할 수 없는 곳 경로 사용자 이름 컴퓨터 명. 한글 쓰지 마라. -->
</body>
  </html>
</fmt:bundle>
