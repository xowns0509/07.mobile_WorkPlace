<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ page errorPage = "02_NormalErrorPage.jsp" %>

<%
	// 1. 드라이버 로딩
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	String user = "scott";
	String pass = "tiger";

	Class.forName(driver);

	// 2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection(url, user, pass);

	// 3. sql 문장 만들기
	String sql = "SELECT * FROM emp";//일부러 에러하나 만들기
	// 4. 전송 객체 얻어오기(statement)
	Statement stmt = con.createStatement();
	// 5. 전송(excuteQuery)
	ResultSet rs = stmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html>
<head>
<title>디비 테스트</title>
</head>
<body>

  <div align=center>
    <table border=2 cellSpacing=3>

      <tr class="title">
        <td>사번</td>
        <td>사원명</td>
        <td>업무</td>
        <td>관리자사번</td>
        <td>입사일</td>
      </tr>

      <%
      	while (rs.next()) {
      %>
      <tr>
        <td><%=rs.getString("empno")%></td>
        <td><%=rs.getString("ename")%></td>
        <td><%=rs.getString("job")%></td>
        <td><%=rs.getString("mgr")%></td>
        <td><%=rs.getString("hiredate")%></td>
      </tr>
      <%
      	} //while반복문
      %>

    </table>
  </div>
</body>
</html>