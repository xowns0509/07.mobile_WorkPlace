package mybatis.guest.service;

import java.util.List;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentSessionRepository;

public class CommentService {

	// 싱글톤 만들기
	private static CommentService service;

	public static CommentService getInstance() {
		if (service == null)
			service = new CommentService();
		return service;

	}

	private CommentSessionRepository repository = new CommentSessionRepository();

	public List<Comment> select() {
		return repository.Select();
	}

	public Integer insertComment(Comment c) {
		return repository.insert(c);
	}

	public Comment selectByPK(long cId) {
		return repository.Select(cId);
	}
	
	public Integer deleteComment(Comment c) {
		return repository.delete(c);
	}
	
	public Integer updateComment(Comment c) {
		return repository.update(c);
	}

	// view단에서 commentservice만
}
