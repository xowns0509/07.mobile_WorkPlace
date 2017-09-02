<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="mybatis.guest.model.Comment"%>
<%@ page import="mybatis.guest.service.CommentService"%>

<!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
<%
	request.setCharacterEncoding("EUC-KR");
%>

<!-- 이전 폼의 각각의 데이터를 빈즈의 멤버로 지정 -->
<%-- <jsp:useBean id="comment" class="mybatis.guest.model.Comment"> --%>
<%--   <jsp:setProperty name="comment" property="*" /> --%>
<%-- </jsp:useBean> --%>

<!-- 서비스의 메소드 호출  -->
<%
	long commentNo = Integer.parseInt(request.getParameter("cId"));
	Comment comment = CommentService.getInstance().selectByPK(commentNo);
	int result = CommentService.getInstance().deleteComment(comment);
%>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>

  <%=result%>의 행이 삭제되었는지 확인해보세요.
  <br />
  <a href="listComment.jsp">목록보기</a>

</body>
</html>