<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>데이타 받는 페이지</title>
</head>
<body>

  전 페이지의 값: ${param.data }
  <!-- param으로 통으로 받는다고. 그중에 data에 담긴 값인
  'important'를 갖고 오겠지 -->
  <br />

  세션의 값: ${session.login }
  <!-- 그냥 session이라 주면 JSP의 세션이랑 충돌남.
  원래 의도코자 했던 '전페이지의 값'을 못 표현함.-->
  <!-- JSP자체가 session이란 자체를 쓰고 있음 -->
  <br />

  쿠키의 값: ${cookie.isFlag.value}
  <!-- 쿠키의 변수명(이름)과 그 값. -->
  <br />


  <hr>


</body>
</html>