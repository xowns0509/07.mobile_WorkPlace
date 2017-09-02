<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.model.*,board.service.*"%>

<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("UTF-8");
%>

<!-- 1. 이전 화면의 입력값을 넘겨받아 BoardRec 객체의 각 멤버변수로 지정 -->
<jsp:useBean id="boardRec" class="board.model.BoardRec">
  <jsp:setProperty name="boardRec" property="*" />
</jsp:useBean>

<%
	// 2. Service에 update() 호출하여 레코드 수정
	ModifyArticleService service = ModifyArticleService.getInstance();
	int result = service.update(boardRec);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>

  <%
  	if (result != 0) {
  		//response.sendRedirect("BoardView.jsp?id=" + boardRec.getArticleId());
  %>
  <%=result%>개의 글을 수정하였습니다.
  <a href="BoardModifyForm.jsp?id=<%=boardRec.getArticleId()%>">다시 수정하기 </a>
  <a href="BoardList.jsp">목록보기 </a>
  <%
  	} else {
  %>
  수정이 실패되었습니다.
  <a href="BoardModifyForm.jsp?id=<%=boardRec.getArticleId()%>">되돌아가기 </a>
  <%
  	}
  %>



  <%
  	// 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
  	// 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
  %>

</body>
</html>