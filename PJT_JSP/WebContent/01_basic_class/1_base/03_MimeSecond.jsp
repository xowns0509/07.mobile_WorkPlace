<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%!Connection conn = null;
	Statement ps = null;
	ResultSet rs = null;

	public void DBLoading() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
		}

		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "scott", "tiger");

			ps = conn.createStatement();
			rs = ps.executeQuery("select * from emp");
		} catch (java.sql.SQLException e) {
			System.out.println(e);
		}
	}%>


<%-- MIME 타입 변경하기 --%>
<!-- mine 타입을 jsp에선  -->
<%
	//1. request의 객체를 통해 type 이름의 값을 넘겨받는다
	String type = request.getParameter("type");

	//2. null 이라면 html파일 형식으로 기술
	if (type == null) {
		response.setContentType("text/html");
	} else {
		if (type.equals("word")) {
			response.setContentType("application/msword");
		} else if (type.equals("excel")) {
			response.setContentType("application/vnd.ms-excel");
		}
		//3. excel이라면 excel파일 형식으로 기술    
	}
	//4. word   라면 word파일 형식으로 기술
%>

<!DOCTYPE html>
<html>
<head>
<title>MIME TYPE</title>
<style type="text/css">
body {
	background: #white;
	color: #black;
}

a:link {
	text-decoration: none;
	color: #646464
} /* 방문하지 않은 링크 색깔 */
a:visited {
	text-decoration: none;
	color: #646464
} /* 방문한 링크 색깔 */
a:active {
	text-decoration: none;
	color: #646464
} /* 마우스로 클릭하는 순간 색깔 */
a:hover {
	color: #3B78A7;
	text-decoration: underline
} /* 마우스 오버시 색깔 */
.title {
	background: #333333;
	font-size: 15px;
	color: #ffff33;
	text-align: center;
	height: 30px;
}

.oddRow {
	background: #f7ffde;
	margin-left: 30px;
	font-size: 12px;
}

.evenRow {
	background: #c8e9ff;
	margin-left: 30px;
	font-size: 12px;
}
</style>
</head>
<body>

  <div align=center>
    <table border='0' cellSpacing='3'>
      <tbody>
        <tr class="title">
          <td>사번</td>
          <td>사원명</td>
          <td>업무</td>
          <td>관리자사번</td>
          <td>입사일</td>
        </tr>

        <%
        	DBLoading();
        %>
        <%
        	while (rs.next()) {
        %>
        <tr>
          <td class="oddRow"><%=rs.getString(1)%></td>
          <td class="oddRow"><%=rs.getString(2)%></td>
          <td class="oddRow"><%=rs.getString(3)%></td>
          <td class="oddRow"><%=rs.getString(4)%></td>
          <td class="oddRow"><%=rs.getString(5)%></td>
        </tr>


        <%
        	if (rs.next()) {
        %>

        <tr>
          <td class="evenRow"><%=rs.getString(1)%></td>
          <td class="evenRow"><%=rs.getString(2)%></td>
          <td class="evenRow"><%=rs.getString(3)%></td>
          <td class="evenRow"><%=rs.getString(4)%></td>
          <td class="evenRow"><%=rs.getString(5)%></td>
        </tr>
        <%
        	} // if-end
        	} // while-end
        %>

      </tbody>
    </table>
  </div>
</body>
</html>
