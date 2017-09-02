package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO_bak1 {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	String user = "scott";
	String pass = "tiger";

	private MemberDAO_bak1() throws Exception {
		// 2-1. 생성자를 프라이빗으로 막음.
		// 아무나 new MemberDAO()로 호출 할 수 없도록.
		// 또한 단 한 번만 호출 되도록 static.

		// 1. 드라이버로딩
		Class.forName(driver);

	}

	// 6-2. dao를 사용하는 getInstance()가 static이므로
	// dao도 static으로 설정. 정석으로는 private로 접근제한자를
	// 하나 더 줘야 함.
	static MemberDAO_bak1 dao = null;
	// 2-5. 일단 getInstance() 밖에다 dao를 선언하긴 해야 함.
	// 그래야 밑의 getInstance()에서 dao == null 일 때 생성이 가능하지.
	// 그렇다고 저 getInstance() 안에다 만들 수 없잖아. 지역변수가 되는 데.

	// 2. 생성자를 private 때렸으니 getInstance()메소드를 만들어 생성하게 끔 함.
	// 이 메소드는 외부에서 불려야 하니 public으로 공용지정.
	public static MemberDAO_bak1 getInstance() throws Exception {
		// 6-1 외부에서 MemberDAO.getInstance()로 getInstance()가 실행될 수 있도록
		// static으로 설정.(static으로 지정하면 클래스명.메소드명()이 가능하니)

		// 3. dao가 한 번도 안 만들어졌다면(null)
		// dao = new MemberDAO(); 로 객체생성하고
		if (dao == null)
			dao = new MemberDAO_bak1();

		// 4. null이 아니라면 기존에 생성했던 dao를 넘겨줌.//
		return dao;
	}

	// 예외를 던져서 사용자에게 표시해주는 게 나음.
	// 그래서 그냥 throws Exception을 기술.
	public int insertMember(Member m) throws Exception {
		int result = 0;

		// 2. 연결객체 얻어오기
		Connection con = DriverManager.getConnection(url, user, pass);

		// 3. sql문장 만들기 (INSERT 문장 만들기)
		String sql = "INSERT INTO memberTemp VALUES(?,?,?,?,?)";

		// 4. sql 전송객체 얻어오기 (preparedStatement)
		PreparedStatement ps = con.prepareStatement(sql);// 여기선 prepared가
															// 아님.
															// 그리고 여기서
															// sql끌고감.
		ps.setString(1, m.getId());
		ps.setString(2, m.getPass());
		ps.setString(3, m.getName());
		ps.setString(4, m.getAddr());
		ps.setString(5, m.getTel());

		// 5. 전송(executeUpdate()) 그 리턴값을 result 변수에 저장
		result = ps.executeUpdate();
			// 7. 닫기
			ps.close();
			con.close();


		return result;
	}

	public String showName(Member m) throws Exception {
		String returnName = null;

		// 2. 연결객체 얻어오기
		Connection con = DriverManager.getConnection(url, user, pass);

		// 3. sql문장 만들기 (INSERT 문장 만들기)
		String sql = "SELECT NAME FROM memberTemp WHERE ID = ? AND PASSWORD = ? ";

		// 4. sql 전송객체 얻어오기 (preparedStatement)
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, m.getId());
		ps.setString(2, m.getPass());

		// 5. 전송(executeUpdate()) 그 리턴값을 result 변수에 저장.
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			returnName = rs.getString("NAME");
		}

		// 7. 닫기
		ps.close();
		con.close();

		return returnName;
	}
}
