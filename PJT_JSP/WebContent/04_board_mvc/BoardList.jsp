<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvc.board.model.*"%>
<%@ page import="java.util.List"%>

<%
	//웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma", "No-cache"); // HTTP 1.0 version
	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 version
	response.setHeader("Cache-Control", "no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L); // 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>

<%
	// Service에 getArticleList()함수를 호출하여 전체 메세지 레코드 검색
	List<BoardRec> mList = (List<BoardRec>) (request.getAttribute("param"));

	// 	ListArticleService service = ListArticleService.getInstance();
	// 	List<BoardRec> mList = service.getArticleList();
	String projectName = "/JSP";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
</head>

<BODY>

  <h3>게시판 목록</h3>

  <table border="1" bordercolor="darkblue">
    <tr>
      <td>글번호</td>
      <td>제 목</td>
      <td>작성자</td>
      <td>작성일</td>
      <td>조회수</td>
    </tr>


    <%
    	if (mList == null) {
    %>
    <tr>
      <td colspan="5">등록된 게시물이 없습니다.</td>
    </tr>
    <%
    	} else {
    %>

    <!-- 출력 -->
    <%
    	for (BoardRec rec : mList) {
    %>
    <tr>
      <td><%=rec.getArticleId()%></td>
      <td>
        <%
        	for (int i = 0; i < rec.getLevel(); i++) {
        %>
        &nbsp;
        <%
        	}
        %>

        <%
        	if (rec.getLevel() != 0) {
        %>
        <img src="imgs/board_re.gif" />
        <%
        	} //end of if
        %>

        <a href="<%=projectName%>/BoardControl?cmd=show-form&articleId=<%=rec.getArticleId()%>"><%=rec.getTitle()%></a>
      </td>
      <td><%=rec.getWriterName()%></td>
      <td><%=rec.getPostingDate()%></td>
      <td><%=rec.getReadCount()%></td>
    </tr>
    <%
    	} //end of for
    %>
    <%
    	} // end else
    %>

    <tr>
      <td colspan="5">
        <a href="write.bc?write-form">글쓰기</a>
      </td>
    </tr>
  </table>
</BODY>
</HTML>
