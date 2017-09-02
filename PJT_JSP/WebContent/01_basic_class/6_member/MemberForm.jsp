<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	//중복확인 버튼이 눌렸을 때 이벤트 확인 > 아이디에 입력한 값을 alert창으로 찍음.

	window.onload = function() {

		var btn = document.getElementById('btn');

		btn.addEventListener('click', function() {
			var id = document.getElementById('id').value;

			if (id == "" || id == null) {
				alert('아이디를 입력하세요');
				return;

			} else {
				var path = "IdCheck.jsp?id=" + id;
				//IdCheck.jsp?id=xxxxx 경로 만들 때 '='뒤에 공백 써주면 안 됨. 이거 못 찾음.
				var winObj = window.open(path, "", "width=500, height=300");
				//window.open("3_2_window_opened.html","이름이라고. 필요 없다고.","width=800, height=280");

			}
		});
	}
</script>

</head>
<body>

  <!-- 화면에 입력하는 폼 만들기 - 사용자의 입력값 확인(js/jquery + css) -->
  <form name='frm' action="InsertMember.jsp" method="post">

    <fieldset>
      <!-- fieldset: 테두리 정해주는거 -->
      <legend>로그인 정보</legend>
      <ol>
        <li><label for='id'>아이디</label> <input id='id' name="id" type='text' required /></li>
        <input id='btn' type='button' value='중복확인' />
        <li><label for='pw'>비밀번호</label> <input id='pw' name="pw" type='PASSWORD' /></li>
      </ol>
    </fieldset>

    <fieldset>
      <legend>개인정보</legend>
      <ol>
        <li><label for='name'>이름</label> <input id='name' name="name" type='text' maxlength='5' placeholder="5자미만 입력하세요" /></li>
        <li><label for='addr'>주소</label> <input id='addr' name="addr" type='text' placeholder="example@example.com" /></li>
        <li><label for='call'>전화번호</label> <input id='call' name="tel" type='text' /></li>
      </ol>
    </fieldset>

    <fieldset>
      <button type='submit'>제출</button>
      <button type='button' id='clear_btn'>텍필드 비우기</button>
      <a href="LoginForm.jsp" id="login">로그인</a>
    </fieldset>

  </form>
  <!-- 데이터베이스에 이 내용을 담을 수 있는 테이블
  테이블명: memberTemp
  id varchar2(20)       PK
  password varchar2(20) NN
  name varchar2(20)     NN
  addr varchar2(100)
  tel  varchar2(20) -->
</body>
</html>
