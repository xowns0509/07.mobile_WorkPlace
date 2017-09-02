package board.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {

	// Single Pattern
	private static BoardDao instance;

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
	public static BoardDao getInstance() throws BoardException {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}

	private BoardDao() throws BoardException {

		try {

			/********************************************
			 * 1. 오라클 드라이버를 로딩 ( DBCP 연결하면 삭제할 부분 )
			 */
			// Class.forName(dbDriver);
			// 컨텍스트가 원래이름으로 뭔가 찾는 놈
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			throw new BoardException("DB 연결시 오류  : " + ex.toString());
		}

	}

	// --------------------------------------------
	// ##### 게시글 입력전에 그 글의 그룹번호를 얻어온다
	public int getGroupId() throws BoardException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int groupId = 1;
		try {
			// 1. 연결객체(Connection) 얻어오기

			// 이젠 oracle에 직접 연결하여 connection을 생성하는게 아니라
			// 톰켓에서 미리 만들어 놓고 열어 놓은 ConnectionPool에 있는 커넥션을 얻어오기

			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "SELECT SEQ_GROUP_ID_ARTICLE.nextval as group_id FROM dual";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			// 4. 전송하기
			rs = ps.executeQuery();

			while (rs.next()) {

				groupId = rs.getInt("group_id");

			}

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴
			return groupId;

		} catch (Exception ex) {
			throw new BoardException("게시판 ) 게시글 입력 전에 그룹번호 얻어올 때  : " + ex.toString());
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

	// --------------------------------------------
	// ##### 게시판에 글을 입력시 DB에 저장하는 메소드
	public int insert(BoardRec rec) throws BoardException {

		/************************************************
		*/
		ResultSet rs = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		try {

			con = ds.getConnection();
			String sql = "INSERT INTO article values(seq_article_id_article.nextval, ?,?,sysdate,?,?,?,?,?)";
			// to_char(sysdate,'yy/mm/dd')
			ps = con.prepareStatement(sql);
			ps.setInt(1, rec.getGroupId());
			ps.setString(2, rec.getSequenceNo());
			ps.setInt(3, rec.getReadCount());
			ps.setString(4, rec.getWriterName());
			ps.setString(5, rec.getPassword());
			ps.setString(6, rec.getTitle());
			ps.setString(7, rec.getContent());

			ps.executeUpdate();
			//
			//
			// // 1. 연결객체(Connection) 얻어오기
			// // con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// con = ds.getConnection();
			//
			// // 2. sql 문장 만들기 (INSERT 문장 만들기)
			// String sql = "INSERT INTO ARTICLE
			// VALUES(SEQ_ARTICLE_ID_ARTICLE.nextval, ?, ?, sysdate, ?, ?, ?, ?,
			// ?)";
			//
			// // 3. 전송객체 얻어오기 (preparedStatement)
			// ps = con.prepareStatement(sql);
			//
			// // ARTICLE_ID NOT NULL NUMBER
			// ps.setInt(1, rec.getGroupId());// GROUP_ID NUMBER
			// ps.setString(2, rec.getSequenceNo());// SEQUENCE_NO CHAR(16)
			// // POSTING_DATE DATE sysdate
			// ps.setInt(3, rec.getReadCount());// READ_COUNT NUMBER
			// ps.setString(4, rec.getWriterName());// WRITER_NAME VARCHAR2(20)
			// ps.setString(5, rec.getPassword());// PASSWORD VARCHAR2(20)
			// ps.setString(6, rec.getTitle());// TITLE VARCHAR2(100)
			// ps.setString(7, rec.getContent());// CONTENT VARCHAR2(1024)
			//
			// // 4. 전송하기
			// ps.executeUpdate();
			//
			// // 5. 4번에서 넘겨받은 입력된 행수를 리턴
			//// return result;

			return -1;

		} catch (Exception ex) {
			throw new BoardException("게시판 ) DB에 입력시 오류  : " + ex.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
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

	// --------------------------------------------
	// ##### 전체 레코드를 검색하는 함수
	// 리스트에 보여줄거나 필요한 컬럼 : 게시글번호, 그룹번호, 순서번호, 게시글등록일시, 조회수, 작성자이름, 제목
	// ( 내용, 비밀번호 제외 )
	// 순서번호(sequence_no)로 역순정렬
	public List<BoardRec> selectList() throws BoardException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardRec> mList = new ArrayList<BoardRec>();
		boolean isEmpty = true;

		BoardRec rec = null;

		try {
			// 게시판 DB에서 검색
			// 만일 하나라도 검색이 된다면 isEmpty 값을 false로 변경
			// 검색된 내용을 List<BoardRec> 저장하기

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기
			// 전부 다 갖고 와야 해. 모든 컬럼값들 다 갖고 오기 그래야 답변하기가 됨.
			String sql = "SELECT * FROM article ORDER BY sequence_no DESC";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			// 4. 전송하기
			rs = ps.executeQuery();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴

			while (rs.next()) {
				rec = null;
				rec = new BoardRec();

				// ARTICLE_ID NOT NULL NUMBER
				// GROUP_ID NUMBER
				// SEQUENCE_NO CHAR(16)
				// POSTING_DATE DATE
				// READ_COUNT NUMBER
				// WRITER_NAME VARCHAR2(20)
				// PASSWORD VARCHAR2(20)
				// TITLE VARCHAR2(100)
				// CONTENT VARCHAR2(1024)

				rec.setArticleId(rs.getInt("ARTICLE_ID"));
				rec.setContent(rs.getString("CONTENT"));
				rec.setGroupId(rs.getInt("GROUP_ID"));
				rec.setPassword(rs.getString("PASSWORD"));
				rec.setPostingDate(rs.getString("POSTING_DATE"));
				rec.setReadCount(rs.getInt("READ_COUNT"));
				rec.setSequenceNo(rs.getString("SEQUENCE_NO"));
				rec.setTitle(rs.getString("TITLE"));
				rec.setWriterName(rs.getString("WRITER_NAME"));

				mList.add(rec);
				isEmpty = false;
			}

			if (isEmpty)
				return Collections.emptyList();

			return mList;
		} catch (Exception ex) {
			throw new BoardException("게시판 ) DB에 목록 검색시 오류  : " + ex.toString());
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

	// --------------------------------------------
	// ##### 게시글번호에 의한 레코드 검색하는 함수
	public BoardRec selectById(int id) throws BoardException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardRec rec = null;

		try {

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기
			String sql = "SELECT * FROM article  WHERE ARTICLE_ID = ?";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			// 4. 전송하기
			rs = ps.executeQuery();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴

			while (rs.next()) {
				rec = null;
				rec = new BoardRec();

				// ARTICLE_ID NOT NULL NUMBER
				// GROUP_ID NUMBER
				// SEQUENCE_NO CHAR(16)
				// POSTING_DATE DATE
				// READ_COUNT NUMBER
				// WRITER_NAME VARCHAR2(20)
				// PASSWORD VARCHAR2(20)
				// TITLE VARCHAR2(100)
				// CONTENT VARCHAR2(1024)

				rec.setArticleId(rs.getInt("ARTICLE_ID"));
				rec.setContent(rs.getString("CONTENT"));
				rec.setGroupId(rs.getInt("GROUP_ID"));
				rec.setPassword(rs.getString("PASSWORD"));
				rec.setPostingDate(rs.getString("POSTING_DATE"));
				rec.setReadCount(rs.getInt("READ_COUNT"));
				rec.setSequenceNo(rs.getString("SEQUENCE_NO"));
				rec.setTitle(rs.getString("TITLE"));
				rec.setWriterName(rs.getString("WRITER_NAME"));

			}

			return rec;
		} catch (Exception ex) {
			throw new BoardException("게시판 ) DB에 글번호에 의한 레코드 검색시 오류  : " + ex.toString());
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

	// --------------------------------------------
	// ##### 게시글 보여줄 때 조회수 1 증가
	public void increaseReadCount(String article_id) throws BoardException {

		PreparedStatement ps = null;
		try {

		} catch (Exception ex) {
			throw new BoardException("게시판 ) 게시글 볼 때 조회수 증가시 오류  : " + ex.toString());
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

	// --------------------------------------------
	// ##### 게시글 수정할 때
	// ( 게시글번호와 패스워드에 의해 수정 )
	public int update(BoardRec rec) throws BoardException {

		int result = 0;
		PreparedStatement ps = null;
		try {

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "UPDATE article SET content = ?, title = ? WHERE ARTICLE_ID=? AND PASSWORD=?";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			ps.setString(1, rec.getContent());
			ps.setString(2, rec.getTitle());
			ps.setInt(3, rec.getArticleId());
			ps.setString(4, rec.getPassword());

			// 4. 전송하기
			result = ps.executeUpdate();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴
			return result; // 나중에 수정된 수를 리턴하시오.

		} catch (Exception ex) {
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString());
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

	// --------------------------------------------
	// ##### 게시글 삭제할 때
	// ( 게시글번호와 패스워드에 의해 삭제 )
	public int delete(int article_id, String password) throws BoardException {
		int result = 0;
		PreparedStatement ps = null;
		try {

			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			// 2. sql 문장 만들기 (INSERT 문장 만들기)
			String sql = "DELETE FROM article WHERE ARTICLE_ID=? AND PASSWORD=?";

			// 3. 전송객체 얻어오기 (preparedStatement)
			ps = con.prepareStatement(sql);

			ps.setInt(1, article_id);
			ps.setString(2, password);

			// 4. 전송하기
			result = ps.executeUpdate();

			// 5. 4번에서 넘겨받은 입력된 행수를 리턴
			return result; // 나중에 수정된 수를 리턴하시오.

		} catch (Exception ex) {
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString());
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

	// ----------------------------------------------------
	// ##### 부모레코드의 자식레코드 중 마지막 레코드의 순서번호를 검색
	// ( 제일 작은 번호값이 마지막값임)
	public String selectLastSequenceNumber(String maxSeqNum, String minSeqNum) throws BoardException {
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 1. 연결객체(Connection) 얻어오기
			// con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			con = ds.getConnection();

			String sql = "SELECT min(sequence_no) as minseq FROM article WHERE sequence_no < ? AND sequence_no >= ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, maxSeqNum);
			ps.setString(2, minSeqNum);
			rs = ps.executeQuery();
			if (!rs.next()) {
				return null;
			}

			return rs.getString("minseq");
		} catch (Exception ex) {
			throw new BoardException("게시판 ) 부모와 연관된 자식 레코드 중 마지막 순서번호 얻어오기  : " + ex.toString());
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
}

// ARTICLE_ID NOT NULL NUMBER
// GROUP_ID NUMBER
// SEQUENCE_NO CHAR(16)
// POSTING_DATE DATE
// READ_COUNT NUMBER
// WRITER_NAME VARCHAR2(20)
// PASSWORD VARCHAR2(20)
// TITLE VARCHAR2(100)
// CONTENT VARCHAR2(1024)