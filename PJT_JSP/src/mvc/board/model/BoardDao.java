package mvc.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDao
{
	
	// Single Pattern 
	private static BoardDao instance;
	
	// DB 연결시  관한 변수 
//	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
//	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:orcl";
//	private static final String		dbUser		=	"scott";
//	private static final String		dbPass		=	"tiger";
	
	
	private Connection	 		con;	
	DataSource ds;
	
	//--------------------------------------------
	//#####	 객체 생성하는 메소드 
	public static BoardDao	getInstance() throws BoardException
	{
		if( instance == null )
		{
			instance = new BoardDao();
		}
		return instance;
	}
	
	private BoardDao() throws BoardException
	{
	
		try{
			
			/********************************************
				1. 오라클 드라이버를 로딩
					( DBCP 연결하면 삭제할 부분 )
			*/
//			Class.forName( dbDriver );	
			Context init =new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			
		}catch( Exception ex ){
			throw new BoardException("DB 연결시 오류  : " + ex.toString() );	
		}
		
	}
	
	
	//--------------------------------------------
	//#####	 게시글 입력전에 그 글의 그룹번호를 얻어온다
	public int getGroupId() throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		int groupId=1;
		try{
			con=ds.getConnection();
			String sql="SELECT seq_group_id_article.nextval group_id FROM dual";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				BoardRec br=new BoardRec();
				groupId=rs.getInt("group_id");
			}
			
			return groupId;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 입력 전에 그룹번호 얻어올 때  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}

	//--------------------------------------------
	//#####	 게시판에 글을 입력시 DB에 저장하는 메소드 
	public int insert( BoardRec rec ) throws BoardException
	{
		
		/************************************************
		*/
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		try{
			con=ds.getConnection();
			String sql="INSERT INTO article values(seq_article_id_article.nextval, ?,?,sysdate,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, rec.getGroupId());
			ps.setString(2, rec.getSequenceNo());
			ps.setInt(3, rec.getReadCount());
			ps.setString(4, rec.getWriterName());
			ps.setString(5, rec.getPassword());
			ps.setString(6, rec.getTitle());
			ps.setString(7, rec.getContent());
			
			return ps.executeUpdate();

//			return -1;
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}

	//--------------------------------------------
	//#####	 전체 레코드를 검색하는 함수
	// 리스트에 보여줄거나 필요한 컬럼 : 게시글번호, 그룹번호, 순서번호, 게시글등록일시, 조회수, 작성자이름,  제목
	//							( 내용, 비밀번호  제외 )
	// 순서번호(sequence_no)로 역순정렬
	public List<BoardRec> selectList() throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardRec> mList = new ArrayList<BoardRec>();
		boolean isEmpty = true;
		
		try{
			con=ds.getConnection();
			//모든 컬럼값을 다 가져오기
			String sql="SELECT * FROM article ORDER BY sequence_no DESC";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				BoardRec rec=new BoardRec();
				rec.setArticleId(rs.getInt("article_id"));
				rec.setGroupId(rs.getInt("group_id"));
				rec.setSequenceNo(rs.getString("SEQUENCE_NO"));
				rec.setTitle(rs.getString("title"));
				rec.setWriterName(rs.getString("Writer_name"));
				rec.setPostingDate(rs.getString("posting_date"));
				rec.setReadCount(rs.getInt("read_count"));
				rec.setPassword(rs.getString("password"));
				rec.setContent(rs.getString("content"));
				mList.add(rec);
				isEmpty=false;
			}

			
			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	
	//--------------------------------------------
	//#####	 게시글번호에 의한 레코드 검색하는 함수
	public BoardRec selectById(int id) throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		BoardRec rec = new BoardRec();
		
		try{
			con=ds.getConnection();
			String sql="SELECT * FROM article WHERE article_id=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			rs=ps.executeQuery();
			if(rs.next()){
				rec.setArticleId(rs.getInt("article_id"));
				rec.setGroupId(rs.getInt("group_id"));
				rec.setSequenceNo(rs.getString("SEQUENCE_NO"));
				rec.setTitle(rs.getString("title"));
				rec.setWriterName(rs.getString("Writer_name"));
				rec.setPostingDate(rs.getString("posting_date"));
				rec.setReadCount(rs.getInt("read_count"));
				rec.setPassword(rs.getString("password"));
				rec.setContent(rs.getString("content"));
			}
			
			return rec;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 글번호에 의한 레코드 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}

	//--------------------------------------------
	//#####	 게시글 보여줄 때 조회수 1 증가
	public void increaseReadCount( String article_id ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			con=ds.getConnection();
			String sql="UPDATE article SET READ_COUNT=READ_COUNT+1 WHERE article_id=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, article_id);
			ps.executeUpdate();

		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 볼 때 조회수 증가시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	//--------------------------------------------
	//#####	 게시글 수정할 때
	//		( 게시글번호와 패스워드에 의해 수정 )
	public int update( BoardRec rec ) throws BoardException
	{
		PreparedStatement ps = null;
		try{
			con=ds.getConnection();
			String sql="UPDATE article SET title=?,POSTING_DATE=sysdate,CONTENT=? WHERE article_id=? and password=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, rec.getTitle());
			ps.setString(2, rec.getContent());
			ps.setInt(3, rec.getArticleId());
			ps.setString(4, rec.getPassword());

			int result=ps.executeUpdate();
			
			return result; // 나중에 수정된 수를 리턴하시오.
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	
	
	//--------------------------------------------
	//#####	 게시글 삭제할 때
	//		( 게시글번호와 패스워드에 의해 삭제 )
	public int delete( int article_id, String password ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			con=ds.getConnection();
			String sql="DELETE FROM article WHERE article_id=? and password=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, article_id);
			ps.setString(2, password);

			int result=ps.executeUpdate();
			
			return result;
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	
	
	//----------------------------------------------------
	//#####  부모레코드의 자식레코드 중 마지막 레코드의 순서번호를 검색
	//       ( 제일 작은 번호값이 마지막값임)
	public String selectLastSequenceNumber( String maxSeqNum, String minSeqNum ) throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try{
//			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			con=ds.getConnection();
			String sql		= "SELECT min(sequence_no) as minseq FROM article WHERE sequence_no < ? AND sequence_no >= ?";  
			ps		= con.prepareStatement( sql );
			ps.setString(1, maxSeqNum);
			ps.setString(2, minSeqNum);
			rs = ps.executeQuery();
			if( !rs.next())
			{				
				return null;
			}
			
			return rs.getString("minseq");
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 부모와 연관된 자식 레코드 중 마지막 순서번호 얻어오기  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}			
	}
}
