package phonelist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PhoneListDao_공사중 {

	// Single Pattern
	private static PhoneListDao_공사중 instance;

	// DB 연결시 관한 변수
	// private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	// private static final String dbUrl =
	// "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	// private static final String dbUser = "scott";
	// private static final String dbPass = "tiger";

	private Connection con;

	// 커넥션pool을 담당하는 DataSource변수
	DataSource ds;

	// --------------------------------------------
	// ##### 객체 생성하는 메소드
	public static PhoneListDao_공사중 getInstance() throws PhoneListException {
		if (instance == null) {
			instance = new PhoneListDao_공사중();
		}
		return instance;
	}

	private PhoneListDao_공사중() throws PhoneListException {

		try {

			/********************************************
			 * 1. 오라클 드라이버를 로딩 ( DBCP 연결하면 삭제할 부분 )
			 */
			// Class.forName(dbDriver);
			// 컨텍스트가 원래이름으로 뭔가 찾는 놈
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			throw new PhoneListException("방명록 ) DB 연결시 오류  : " + ex.toString());
		}

	}

	/*
	 * 메세지를 입력하는 함수
	 */
	public int insert(Phone rec) throws PhoneListException {
		int result = 0;
		PreparedStatement ps = null;
		try {

			// 1. 연결객체(Connection) 얻어오기

			// 이젠 oracle에 직접 연결하여 connection을 생성하는게 아니라
			// 톰켓에서 미리 만들어 놓고 열어 놓은 ConnectionPool에 있는 커넥션을 얻어오기

			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "INSERT INTO GuestTB VALUES(seq_Phone_id.nextval,?,?,?)";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			ps.setString(1, rec.getGuestName());
			ps.setString(2, rec.getPassword());
			ps.setString(3, rec.getPhone());

			// 4. 전송하기
			result = ps.executeUpdate();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴
			return result;
		} catch (Exception ex) {
			throw new PhoneListException("방명록 ) DB에 입력시 오류  : " + ex.toString());
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}

	}

	/*
	 * 메세지 목록 전체를 얻어올 때
	 */
	public List<Phone> selectList() throws PhoneListException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Phone> mList = new ArrayList<Phone>();
		boolean isEmpty = true;

		Phone m = null;

		try {
			// 방명록 DB에서 검색
			// 만일 하나라도 검색이 된다면 isEmpty 값을 false로 변경
			// 검색된 내용을 List<Phone> 저장하기

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "SELECT * FROM GuestTB ORDER BY Phone_ID DESC";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			// 4. 전송하기
			rs = ps.executeQuery();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴

			while (rs.next()) {
				m = null;
				m = new Phone();

				m.setId(rs.getInt("Phone_ID"));
				m.setGuestName(rs.getString("GUEST_NAME"));
				m.setPhone(rs.getString("Phone"));

				mList.add(m);
				isEmpty = false;
			}

			if (isEmpty)
				return Collections.emptyList();

			return mList;
		} catch (Exception ex) {
			throw new PhoneListException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}

	/*
	 * ------------------------------------------------------- 현재 페이지에 보여울 메세지
	 * 목록 얻어올 때
	 */
	public List<Phone> selectList(int firstRow, int endRow) throws PhoneListException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Phone> mList = new ArrayList<Phone>();
		boolean isEmpty = true;

		Phone m = null;

		try {

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "select * from phonelist";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			// 4. 전송하기
			rs = ps.executeQuery();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴

			while (rs.next()) {
				m = null;
				m = new Phone();

				m.setSeq(rs.getInt("SEQ"));
				m.setKijong(rs.getString("KIJONG"));
				m.setPic(rs.getString("PIC"));
				m.setCompany(rs.getString("COMPANY"));
				m.setPrice(rs.getString("PRICE"));
				m.setColor(rs.getString("COLOR"));

				mList.add(m);
				isEmpty = false;
			}

			if (isEmpty)
				return Collections.emptyList();

			return mList;
		} catch (Exception ex) {
			throw new PhoneListException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}

	/*
	 * ------------------------------------------------------- 메세지 전체 레코드 수를 검색
	 */

	public int getTotalCount() throws PhoneListException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;

		try {

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "SELECT COUNT(*) as count FROM GUESTTB";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			// 4. 전송하기
			rs = ps.executeQuery();

			while (rs.next()) {

				count = rs.getInt("COUNT");

			}
			return count;

		} catch (Exception ex) {
			throw new PhoneListException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}

	/*
	 * 메세지 번호와 비밀번호에 의해 메세지 삭제
	 */
	public int delete(int PhoneId, String password) throws PhoneListException {
		int result = 0;
		PreparedStatement ps = null;
		try {

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "DELETE FROM GuestTB WHERE Phone_ID=? AND PASSWORD=?";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			ps.setInt(1, PhoneId);
			ps.setString(2, password);

			// 4. 전송하기
			result = ps.executeUpdate();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴
			return result;
		} catch (Exception ex) {
			throw new PhoneListException("방명록 ) DB에 삭제시 오류  : " + ex.toString());
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}
}
