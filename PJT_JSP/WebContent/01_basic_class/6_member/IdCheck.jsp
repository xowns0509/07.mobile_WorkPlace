<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.beans.Member"%>
<%@ page import="member.beans.MemberDAO"%>
<%
	String id = null;

	//resultB = MemberDAO.getInstance().isDuplicatedId(id);
	//true = 사용이 불가능한 ID, false = 사용 가능ID

	if (request.getParameter("idNew") == null) {
		id = request.getParameter("id");
	} else {
		id = request.getParameter("idNew");
	}

	String result = null;
	boolean resultB = false;

	if (MemberDAO.getInstance().isDuplicatedId(id)) {
		result = "이미 사용중인 아이디입니다.";
		resultB = true;
	} else {
		result = "사용이 가능한 아이디";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 외부css연결. href로 삽입하고자 하는 css파일의 경로주기.
type="text/css". 텍스트형식의 css파일이란 뜻. -->
<!-- 점 하나(./)는 현재 디렉토리에서, 두 개(../)는 부모 디렉토리로 올라가는 거. -->
<link href="./css/myform.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	//중복확인 버튼이 눌렸을 때 이벤트 확인 > 아이디에 입력한 값을 alert창으로 찍음.

	window.onload = function() {

		var useBtn = document.getElementById('useBtn');
		useBtn.addEventListener('click', function() {

			if (document.getElementById('result').value == "이미 사용중인 아이디입니다.") {
				alert("새로운 아이디로 지정하세요");
				return;
			}

			//alert("useBtn");
			window.opener.document.frm.id.value = document
					.getElementById('idNew').value;
			window.close();
		});
		
		

	}
</script>

</head>
<body>

  <!-- 화면에 입력하는 폼 만들기 - 사용자의 입력값 확인(js/jquery + css) -->
  <form method="post">

    <fieldset>
      <!-- fieldset: 테두리 정해주는거 -->
      <legend>아이디 중복확인</legend>
      <ol>
        <li><label for='idNew'>아이디</label> <input id='idNew' name="idNew" type='text' value=<%=id%> />
          <button type='submit'>중복확인</button> <%
 	if (!resultB) {
 %>
          <button type='button' id='useBtn'>사용하기</button></li>
        <%
        	}
        %>

        <li><label for='result'>결과 : </label><input id='result' type='text' value="<%=result%>" disabled /></li>
      </ol>
    </fieldset>
  </form>

  <!--
포스트백 : 문서 자기자신에게 자료를 전송하는 형태를 일명 포스트백이라 부른다.
아래처럼 action속성에 문서자기자신의 이름을 지정하는 형태를 포스백이라 부른다.
form태그에서 method를 생략할 경우 기본값은 get이다.
form태그에서 action을 생략할 경우 기본값은 문서 자기자신.
-->

  <%--   <% --%>
  <!-- //   	request.setCharacterEncoding("euc-kr"); -->
  <%--   %> --%>
  <!--   <form method="post" action="Intro09.jsp"> -->
  <%--     키워드 : <input type="text" name="keyword" value="<%if (request.getParameter("keyword") != null) {%><%=request.getParameter("keyword")%><%}%>"> <input type="submit" value="확인"> --%>
  <!--   </form> -->
  <!--   입력한 값 : -->
  <%--   <% --%>
  <!-- //   	//폼변수 keyword의 값을 출력 -->
  <!-- //   	out.println(request.getParameter("keyword")); -->
  <%--   %> --%>

</body>
</html>