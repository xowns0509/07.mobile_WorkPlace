<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="mybatis.guest.model.Comment"%>
<%@ page import="mybatis.guest.service.CommentService"%>


<!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
<%
	long commentNo = Integer.parseInt(request.getParameter("cId"));
	Comment comment = CommentService.getInstance().selectByPK(commentNo);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 보기</title>
<script type="text/javascript">
window.onload = init;

function init() {

	document.getElementById("btnDelete").onclick = function() {
		//2. confirm - 확인 취소 창
		var res = confirm('이 페이지를 삭제하시겠습니까?');
		//결과치를 받는 게 res. 확인을 누르면 true를, 취소를 누르면 false 반환. 
		alert("취소합니다");
		if (res)//res가 true일 때 location.href로 naver로 리다이렉트.  
			location.href = "DeleteCommentSave.jsp?cId=<%=comment.getCommentNo()%>";

		};

	}
</script>

</head>
<body>
  <table border="1">
    <tr>
      <td>작성자</td>
      <td><%=comment.getCommentNo()%></td>
    </tr>
    <tr>
      <td>메세지</td>
      <td><%=comment.getCommentContent()%></td>
    </tr>
    <tr>
      <td>등록일</td>
      <td><%=comment.getRegDate()%></td>
    </tr>
    <tr>
      <td colspan="2">

        <a href="ModifyCommentForm.jsp?cId=<%=comment.getCommentNo()%>"><input type="button" name="btnModify" value="수정" /></a>
        <input type="button" name="btnDelete" id="btnDelete" value="삭제" />
      </td>
    </tr>
  </table>
</body>
</html>