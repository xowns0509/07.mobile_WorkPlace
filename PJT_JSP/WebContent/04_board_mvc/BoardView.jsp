<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvc.board.model.*"%>

<%
	// 1. 해당 게시물의 게시글번호값을 얻어온다
	// 2. Service에 getArticleById() 호출하여 그 게시글번호를 갖는 레코드를 검색한다.
	BoardRec rec = (BoardRec) (request.getAttribute("postResult"));
	String projectName = "/JSP";
	// 	String id = request.getParameter("id");
	// 	System.out.println(id);
	// 	//int listid=Integer.parseInt(id);
	// 	ViewArticleService service = ViewArticleService.getInstance();
	// 	BoardRec rec = service.getArticleById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
</head>
<body>

  <h4>게시판 글 보기</h4>
  <br />
  <table border="1" bordercolor="red">
    <tr>
      <td>제 목 :</td>
      <td><%=rec.getTitle()%></td>
    </tr>
    <tr>
      <td>작성자 :</td>
      <td><%=rec.getWriterName()%></td>
    </tr>
    <tr>
      <td>작성일자 :</td>
      <td><%=rec.getPostingDate()%></td>
    </tr>
    <tr>
      <td>내 용 :</td>
      <td><%=rec.getContent()%></td>
    </tr>
    <tr>
      <td colspan="2">
        <a href="<%=projectName%>/BoardControl?cmd=list-page">목록보기</a>
        <a href="<%=projectName%>/BoardControl?cmd=list-page&articleId=<%=rec.getArticleId()%>">답변하기</a>
        <a href="<%=projectName%>/BoardControl?cmd=modify-form&articleId=<%=rec.getArticleId()%>">수정하기</a>
        <a href="<%=projectName%>/BoardControl?cmd=list-page&articleId=<%=rec.getArticleId()%>">삭제하기</a>
      </td>
    </tr>
  </table>


</body>
</html>