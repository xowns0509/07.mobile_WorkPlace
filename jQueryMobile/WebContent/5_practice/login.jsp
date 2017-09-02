<%@ page contentType="text/plain;charset=euc-kr"%>
<%@ page import="java.sql.*"%>


<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "scott";
String pass = "tiger";


String uid = request.getParameter("uid");
String upassword = request.getParameter("upassword");

boolean login = false;

Class.forName(driver);
Connection con = DriverManager.getConnection(url, user, pass);
String sql = "SELECT * FROM emp WHERE ename=? AND empno=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uid);
ps.setInt(2, Integer.parseInt(upassword)); 

ResultSet rs = ps.executeQuery();
if( rs.next()){
	login = true;
}
rs.close();
ps.close();
con.close(); 
%>

<div id="login" data-role="page" data-theme="a">
	<div data-role="header" data-theme="a">
		<h1>로그인 결과</h1>
	</div>

	<div data-role="content">
		<%if(login) {%>
		<h3>로그인 성공</h3>
		<a href="#home" data-icon="home" data-role="button" data-inline="true"
			data-direction="reverse">앱홈</a>
		<script type="text/javascript">
						$("#home").attr("data-login", "ok");
					</script>

		<%} else {%>


		<h3>아이디와 패스워드가 틀림</h3>

		<div class="ui-grid-a">
			<div class="ui-block-a">
				<a href="loginform.html" data-role="button" data-icon="gear"
					data-direction="reverse">로그인폼</a>
			</div>
			<div class="ui-block-b">
				<a href="#home" data-icon="home" data-role="button"
					data-direction="reverse">앱홈</a>
			</div>
		</div>

		<%}%>
	</div>
</div>