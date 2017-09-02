<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*"%>
<%@ page import="java.util.List"%>

<%
	String changePageSw = request.getParameter("changePageGroup");
	String startPnumSTR = request.getParameter("startPnumSTR");
	String pNum = request.getParameter("page");

	// 전체 메세지 레코드 검색
	ListMessageService service = ListMessageService.getInstance();
	List<Message> mList = service.getMessageList(pNum);
	//축약형. 한 번만 사용하니까.
	//근데 한 번 이상 사용한다면 축약형 하면 안 됨.

	// 전체 표시할 페이지 번호를 검색

	//한 그룹당 페이지. 3개.
	int countPagePerGroup = 3;

	//totalPageCount 총 페이지 갯수 8개.(글 갯수 말고)
	int totalPageCount = service.getTotalCount();

	String totalPageCountStr = String.valueOf(service.getTotalCount());

	// totalPageGroupCount.
	// 총 페이지그룹 갯수 = totalPageCount / countPagePerGroup. 8/3...2개 남으니까 총 3그룹 필요.
	int totalPageGroupCount = (int) (Math.ceil(((double) totalPageCount / (double) countPagePerGroup)));

	//처음시작은 1
	int startPnum = 0;
	int endPnum = 0;
	int prevPageGroup = 0;
	int nextPageGroup = 0;

	if (startPnumSTR == null) {
		startPnum = 1;
		endPnum = startPnum + countPagePerGroup;
	} else {
		if (changePageSw.equals("plusPnum")) {
			startPnum += countPagePerGroup;
			endPnum = startPnum + countPagePerGroup;
		} else if (changePageSw.equals("minusPnum")) {
			startPnum += startPnum - countPagePerGroup;
			endPnum = startPnum - countPagePerGroup;
		}
	}
	startPnumSTR = String.valueOf(startPnum);

	//페이지당 표시할 번호
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
        <a href="deleteMessage.jsp?id=<%=m.getId()%>&guestName=<%=m.getGuestName()%>">[삭제하기]</a>
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
	border: 1 solid #00009C;"><%=m.getMessage()%>
        </textarea>
      </td>
    </tr>

    <%
    	}
    %>
  </table>

  <%
  	} // end if-else
  %>
  <a href="listMessage.jsp?page=1">◀◀</a>
  <a href="listMessage.jsp?changePageGroup=minusPnum&startPnumSTR=<%=startPnumSTR%>">◁</a>
  <%
  	for (int i = startPnum; i < endPnum; i++) {
  %>
  <a href="listMessage.jsp?page=<%=i%>">[<%=i%>]
  </a>
  <%
  	}
  %>
  <a href="listMessage.jsp?changePageGroup=plusPnum&startPnumSTR=<%=startPnumSTR%>">▷</a>
  <a href="listMessage.jsp?changePageGroup=">▶▶</a>
  <a href="insertMessage.jsp"> [ 글쓰기 ]</a>
  <%=totalPageCount%>
  <%=totalPageGroupCount%>
</body>
</html>