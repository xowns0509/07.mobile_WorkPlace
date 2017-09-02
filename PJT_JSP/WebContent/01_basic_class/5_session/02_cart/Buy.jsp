<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="shop.cart.Goods"%>
<%@ page import="java.util.*"%>

<%
	ArrayList<Goods> glist = null;

	request.setCharacterEncoding("utf-8");

	// 1. 세션에서 list 속성값을 얻어와서 ArrayList 변수에 지정
	Object listInSession = session.getAttribute("list");
	// list
	// session.getAttribute("list");의 리턴형은 object
	// 그래서 쌩으로 받아내야 하는 것도 일단 
	if (listInSession == null)
		return;
	glist = (ArrayList<Goods>) listInSession;

	session.removeAttribute("list");

	// 2. null 이면 리턴 그렇지 않으면 세션값 얻어오기

	// 3. 세션에서 속성을 제거한다
%>

<html>
<body bgcolor="white">
  <table>
    <tr bgcolor="#e7a068">
      <th>상품명</th>
      <th>가격</th>
    </tr>

    <%
    	int sum = 0;
    	int n = glist.size();

    	for (int i = 0; i < n; i++) {
    		Goods goods = (Goods) glist.get(i);
    		int gp = goods.getPrice();
    		sum += gp;
    %>
    <tr>
      <td align="center">
        <%=goods.getName()%></td>
      <td align="right"><%=gp%></td>
    </tr>
    <%
    	}
    %>
    <tr bgcolor="#e7a068">
      <td colspan="2" align="right">
        총액 :
        <%=sum%>
      </td>
    </tr>
  </table>

  <br>
  <br>
  <a href="wshop.jsp">다시 쇼핑하기</a>
</body>
</html>
