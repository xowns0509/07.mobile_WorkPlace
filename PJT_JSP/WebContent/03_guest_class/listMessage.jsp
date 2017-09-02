<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*"%>
<%@ page import="java.util.List"%>

<%
	String pNum = request.getParameter("page");
	ListMessageService service = ListMessageService.getInstance();
	// 전체 메세지 레코드 검색 
	List<Message> mList = service.getMessageList(pNum);

	// 전체 표시할 페이지 번호를 검색
	int totalPageCount = service.getTotalCount();

	int pageNO = 1;
	if (pNum != null) {
		pageNO = Integer.parseInt(pNum);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 목록</title>
</head>
<body>

  <%
  	if (mList.isEmpty()) {
  %>
  남겨진 메세지가 하나도~~없습니다.
  <br>
  <%
  	} else {
  %>
  <table border="1">

    <%
    	for (Message m : mList) {
    %>
    <tr>
      <td><%=m.getId()%></td>
      <td><%=m.getGuestName()%></td>
      <td>
        <a href="deleteMessage.jsp?id=<%=m.getId()%>"> [ 삭제하기 ] </a>
      </td>
    </tr>
    <tr>
      <td colspan='3'>
        <textarea cols=35 rows=3 style="font-family: '돋움', '돋움체';
	font-size: 10pt;
	font-style: normal;
	line-height: normal;
	color: #003399;
	background-color: #D4EBFF;
	border: 1 solid #00009C;"><%=m.getMessage()%></textarea>
      </td>
    </tr>
    <%
    	}
    %>
  </table>

  <%
  	} // end if-else
  %>

  <%
  	int j = pageNO - 1;
  	if (j < 1)
  		j = 1;
  	int k = pageNO + 1;
  	if (k > totalPageCount)
  		k = totalPageCount;

  	int groupPageCount = 3;
  	int initPage = pageNO - 1;
  	int lastPage = pageNO + 1;
  	if (initPage < 1) {
  		initPage = 1;
  		lastPage = 3;
  	}
  	if (lastPage > totalPageCount)
  		lastPage = totalPageCount;

  	int prePage = pageNO - groupPageCount;
  	int nextPage = pageNO + groupPageCount;
  	if (prePage < 1)
  		prePage = 1;
  	if (nextPage > totalPageCount)
  		nextPage = totalPageCount;
  %>

  <a href="listMessage.jsp?page=<%=prePage%>"> ◀◀</a>
  <a href="listMessage.jsp?page=<%=j%>"> &nbsp ◀ </a>

  <%
  	for (int i = initPage; i < lastPage + 1; i++) {
  %>

  <a href="listMessage.jsp?page=<%=i%>"> [ <%=i%> ]
  </a>

  <%
  	}
  %>

  <a href="listMessage.jsp?page=<%=k%>"> ▶</a>
  <a href="listMessage.jsp?page=<%=nextPage%>"> &nbsp ▶▶</a>

  <a href="insertMessage.jsp">[ 글쓰기 ]</a>
</body>
</html>
