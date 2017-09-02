<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.model.*, board.service.*"%>
<%@ page import="java.util.List"%>

<%
	// 웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	// 유독 목록보기에서만 캐시를 지우고 새로 받아야 함.
	// 어떤 사용자가 어떤 브라우저를 사용하는지 모르기에 반드시 아래 4줄을 적어줘야 함.
	response.setHeader("Pragma", "No-cache"); // HTTP 1.0 version
	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 version
	response.setHeader("Cache-Control", "no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L); // 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>

<%
	// Service에 getArticleList()함수를 호출하여 전체 메세지 레코드 검색 
	// 	List<BoardRec> mList = null;
	ListArticleService service = ListArticleService.getInstance();
	List<BoardRec> mList = service.getArticleList();
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

    <!-- 출력부분 -->
    <%
    	for (BoardRec m : mList) {//mlist이란 콜렉션의....
    			//제네릭이 있어야 향상된 for문이 가능하다
    			//만약 이걸 안쓰면 아래와 같이 써야 함.
    			//for (int i = 0; i < mList.size(); i++) {
    			//BoardRec rec = (BoardRec) mList.get(i);
    			//}
    %>
    <tr>
      <td><%=m.getArticleId()%></td>
      <td>
        <%
        	for (int i = 0; i < m.getLevel(); i++) {
        				//답글이 1단계면 공백이 1번, 2단계면 공백이 2번
        %>

        &nbsp;

        <%
        	}
        %>
        <%
        	if (m.getLevel() != 0) {
        %>
        <img src="imgs/board_re.gif" />
        <%
        	}
        %>
        <a href="BoardView.jsp?id=<%=m.getArticleId()%>"><%=m.getTitle()%></a>
      </td>
      <td><%=m.getWriterName()%></td>
      <td><%=m.getPostingDate()%></td>
      <td><%=m.getReadCount()%></td>
    </tr>
    <%
    	} // end for. 누구의 괄호 끝인지 반드시 달아줘라.
    %>
    <%
    	} // end else
    %>

    <tr>
      <td colspan="5">
        <a href="BoardInputForm.jsp">글쓰기</a>
      </td>
    </tr>
  </table>
</BODY>
</HTML>
