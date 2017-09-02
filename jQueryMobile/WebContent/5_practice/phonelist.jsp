<%@ page contentType="text/plain;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="phonelist.Phone"%>

<%
	response.setHeader("cache-control", "no-cache");
	List<Phone> phoneList = new ArrayList<Phone>();
	
	// 1. 드라이버 로딩
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	String user = "scott";
	String pass = "tiger";

	Class.forName(driver);

	// 2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection(url, user, pass);

	// 3. sql 문장 만들기
	String sql = "SELECT * FROM phonelist";

	// 4. 전송 객체 얻어오기(statement)
	Statement stmt = con.createStatement();

	// 5. 전송(excuteQuery)
	ResultSet rs = stmt.executeQuery(sql);

	Phone phoneRec = null;

	while (rs.next()) {
		phoneRec = null;
		phoneRec = new Phone();

		phoneRec.setPnum(rs.getString("SEQ"));
		phoneRec.setKijong("ㄱ6ㄹㄹ1ㄳ3 s4");
		phoneRec.setPic(rs.getString("PIC"));
		phoneRec.setCompany(rs.getString("COMPANY"));
		phoneRec.setPrice(rs.getString("PRICE"));
		phoneRec.setColor(rs.getString("COLOR"));

		phoneList.add(phoneRec);

	}
%>

<%
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	int limit = 4;
	int start = (currentPage - 1) * limit;
	int totalPage = phoneList.size() / limit;
	if (phoneList.size() % limit != 0)
		totalPage++;
%>

<div id="phonelist" data-role="page" data-theme="a">
	<div data-role="header" data-position="fixed" data-theme="a">
		<h1>폰 목록</h1>
		<%
			if (currentPage > 1) {
		%>
		<a href="phonelist.jsp?currentPage=<%=currentPage - 1%>" data-role="button" data-icon="arrow-l" data-direction="reverse">이전</a>
		<%
			}
		%>
		<%
			if (currentPage < totalPage) {
		%>
		<a href="phonelist.jsp?currentPage=<%=currentPage + 1%>" data-role="button" data-icon="arrow-r" data-iconpos="right" class="ui-btn-right">다음</a>
		<%
			}
		%>
	</div>

	<div data-role="content">
		<ul data-role="listview">
			<%
				for (int i = start; i < (start + limit) && i < phoneList.size(); i++) {
			%>
			<li><a href="phonedetail.jsp?pno=<%=phoneList.get(i).getPnum()%>&currentPage=<%=currentPage%>">
					<table>
						<tr>
							<td style="padding-right: 5px"><img src="../image/<%=phoneList.get(i).getPic()%>" style="width: 30px; height: 50px" /></td>
							<td style="padding-left: 5px"><%=phoneList.get(i).getKijong()%></td>
						</tr>
					</table>
			</a></li>
			<%
				}
			%>
		</ul>
	</div>

	<div data-role="footer" data-position="fixed" data-theme="a">
		<div data-role="navbar">
			<ul>
				<li><a href="#home" data-icon="home" data-transition="slide" data-direction="reverse">앱홈</a></li>
				<li><a href="phonesaveform.jsp" data-icon="plus" data-transition="slide">폰등록</a></li>
			</ul>
		</div>
	</div>
</div>

<%
	//List<String[]> phoneDb = (List<String[]>) session.getAttribute("phoneDb");
	/* if (phoneDb == null) {
		phoneDb = new ArrayList<String[]>();
		phoneDb.add(new String[] { "p1", "갤럭시 A", "phone01.png", "삼성", "600000", "검정" });
		phoneDb.add(new String[] { "p2", "갤럭시 U", "phone02.png", "삼성", "500000", "흰색" });
		phoneDb.add(new String[] { "p3", "갤럭시 S", "phone03.png", "삼성", "700000", "검정" });
		phoneDb.add(new String[] { "p4", "갤럭시 S2", "phone04.png", "삼성", "800000", "흰색" });
	
		phoneDb.add(new String[] { "p5", "갤럭시 S3", "phone05.png", "삼성", "600000", "검정" });
		phoneDb.add(new String[] { "p6", "갤럭시 S4", "phone06.png", "삼성", "500000", "흰색" });
		phoneDb.add(new String[] { "p7", "갤럭시 S5", "phone07.png", "삼성", "700000", "검정" });
		phoneDb.add(new String[] { "p8", "갤럭시 S6", "phone08.png", "삼성", "800000", "흰색" });
	
		phoneDb.add(new String[] { "p9", "갤럭시 S7", "phone09.png", "삼성", "600000", "검정" });
		phoneDb.add(new String[] { "p10", "갤럭시 S8", "phone10.png", "삼성", "500000", "흰색" });
		phoneDb.add(new String[] { "p11", "갤럭시 S9", "phone11.png", "삼성", "700000", "검정" });
		phoneDb.add(new String[] { "p12", "갤럭시 S10", "phone12.png", "삼성", "800000", "흰색" });
		session.setAttribute("phoneDb", phoneDb);
	} */
%>

