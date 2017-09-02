package mybatis.guest.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.guest.model.Comment;

public class CommentSessionRepository {

	// 연결할 mapper이름을 변수로.
	String namespace = "mybatis.mapper.CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		// Sql 세션이 필요? - 세션 = 커넥트
		// SqlSession(마이바티즈의...) == Connection(JDBC)
		String resource = "mybatis-config.xml";

		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (Exception ex) {
			System.out.println("mybatis-config.xml 읽어서 실행 실패: " + ex.getMessage());
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}

	// 연결객체를 얻고 싶다면 "Select" 하는 태그를 호출
	public List<Comment> Select() {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listComment"); // 리스트 목록
																	// 뽑아지는데 그거
																	// 바로 리턴한다고.
		} finally {
			sqlSess.close();
		}
	}

	public Comment Select(long cId) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne(namespace + ".viewComment", cId);

		} finally {
			sqlSess.close();
		}
	}
	
//이거 적용하면 viewComment 안 써도 됨.
//	public Comment Select(long cId) {
//		// getSqlSessionFactory를 이용
//		SqlSession sqlSess = getSqlSessionFactory().openSession();
//		try {
//			HashMap<String, Long> condi = new HashMap<String, Long>();
//			condi.put("commentNo", cId);
//
//			return sqlSess.selectOne(namespace + ".viewComment", cId);
//
//		} finally {
//			sqlSess.close();
//		}
//	}

	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer insert(Comment c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.insert(namespace + ".insertComment", c);
			// jdbc: auto-Commit;
			// mybatis는 auto-commit이 아니므로.... 커밋 해줘야 함.

			if (result == 0) {// 리절트가 0이면 입력 실패이므로 롤백
				sqlSess.rollback();

			} else {
				sqlSess.commit();
			}

			return result;
		} finally {
			sqlSess.close();
		}
	}
	
	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer delete(Comment c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.delete(namespace + ".deleteComment", c);
			// jdbc: auto-Commit;
			// mybatis는 auto-commit이 아니므로.... 커밋 해줘야 함.

			if (result == 0) {// 리절트가 0이면 입력 실패이므로 롤백
				sqlSess.rollback();

			} else {
				sqlSess.commit();
			}

			return result;
		} finally {
			sqlSess.close();
		}
	}
	
	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer update(Comment c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.update(namespace + ".updateComment", c);
			// jdbc: auto-Commit;
			// mybatis는 auto-commit이 아니므로.... 커밋 해줘야 함.

			if (result == 0) {// 리절트가 0이면 입력 실패이므로 롤백
				sqlSess.rollback();

			} else {
				sqlSess.commit();
			}

			return result;
		} finally {
			sqlSess.close();
		}
	}

}
