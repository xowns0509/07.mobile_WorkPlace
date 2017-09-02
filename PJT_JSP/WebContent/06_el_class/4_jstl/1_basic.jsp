<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h2>목적은 JSP(뷰 단)에서 java코딩 배제</h2>
  <!-- 변수선언 -->
  <%
  	// String gender = "m"; 원래는 이와 같이 작성했었지. 그러나
  %>
  <c:set var="gender" value="m" />
  <c:set var="age" value="10" />
  <!-- 태그라서, 값 넣을 때 쌍따나 홑따 주는게 html의 규칙이었잖.
  태그라서 쌍따 홑따를 넣어야 해. 값의 형태는 알아서 잡아줌. -->

  <!-- 제어문 사용: if for while switch -->
  <c:if test="${gender == 'm' }">당신은 남정네입니다.</c:if>
  <c:if test="${gender eq 'y' }">당신은 여인네입니다.</c:if>
  <%-- <c:if test="${gender eq 'y' }   ">당신은 여인네입니다.</c:if> --%>
  <!-- 윗 문장 처럼 중괄호와 홑따(혹은 쌍따) 안에 공백주지 말기. 에러로 못 잡아내 -->
  <br />

  c:if 사용.
  <br />
  <!-- 10살 미만 '어린이' 출력,
  10세 이상 20세 미만 '청소년' 출력,
  20세 이상 '성인' 출력-->
  <c:if test="${age lt '10'}">당신은 어린이입니다.</c:if>
  <c:if test="${age ge '10' and age lt '20' }">당신은 청소년입니다.</c:if>
  <c:if test="${age ge '20'}">당신은 성인입니다.</c:if>
  <!-- ${age < '10'} ${age >= '10' and age < '20' } ${age >= '20'}-->
  <br />

  c:choose 사용
  <br />
  <c:choose>
    <c:when test="${age lt '10'}">당신은 어린이입니다.</c:when>
    <c:when test="${age ge '10' and age lt '20' }">당신은 청소년입니다.</c:when>
    <%-- <c:when test="${age ge '20'}">당신은 성인입니다.</c:when> --%>
    <c:otherwise>당신은 성인입니다.</c:otherwise>
  </c:choose>

  <!-- jstl에서 for문 쓰기. -->
  <!-- 1부터 100까지의 합 구하기. -->
  <c:set var="sum" value="0" />
  <c:forEach var="i" begin="1" end="100">
    <c:set var="sum" value="${ sum+i }" />

  </c:forEach>
  1~100까지의 합: ${sum}
  <br />

  <!-- 1부터 100까지의 홀합 밑 짝합 구하기. -->
  <c:set var="oddSum" value="0" />
  <!-- 홀수 -->
  <c:forEach var="i" begin="1" end="50">
    <c:set var="oddSum" value="${ oddSum+i*2 }" />
  </c:forEach>
  1~100까지의 홀수 합: ${oddSum}
  <br />


  <c:set var="evenSum" value="0" />
  <!-- 짝수 -->
  <c:forEach var="i" begin="1" end="50">
    <c:set var="evenSum" value="${ evenSum+(i*2-1) }" />
  </c:forEach>
  1~100까지의 짝수 합: ${evenSum}
  <br />



  <!-- 짝수 -->
  <c:forEach var="i" begin="1" end="9">

    <c:forEach var="j" begin="1" end="9">
      <c:set var="gugu" value="0" />
      <c:set var="gugu" value="${ gugu=i*j }" />
      ${gugu} = ${i} * ${j}
      <br />
    </c:forEach>

    <br />
  </c:forEach>
  <br />

</body>
</html>

<!-- 기존의 놈들을 쓰기 위해 
JSP 기초문법.
< %@    % > : directive.
페이지를 설정하는 페이지 디렉티브
다른 놈을 끌어오는 include
taglib

< %!    % > : 멤버 변수나 함수를 선언 부
< %     % > : scriptlet 자바 코드 자유롭게 쓸 수 있는 공간.
< %=    % > : 표현부. 변수나 함수의 결과값 출력용.

jstl은 오래전부터 있었다. java.sun.com으로 끌어오는 걸 보면
개발자들이 귀찮아서 안썼을 뿐.

-->