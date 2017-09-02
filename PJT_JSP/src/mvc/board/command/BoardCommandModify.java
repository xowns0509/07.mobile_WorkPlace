package mvc.board.command;

import javax.servlet.http.HttpServletRequest;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;
import mvc.board.model.BoardRec;

public class BoardCommandModify implements BoardCommand {
	private String next;

	public BoardCommandModify( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request) throws BoardCommandException {
		// TODO Auto-generated method stub
		try{
			BoardRec rec = new BoardRec();
			
			rec.setTitle(request.getParameter("title"));
			rec.setContent(request.getParameter("content"));
			rec.setArticleId(Integer.parseInt(request.getParameter("articleId")));
			rec.setPassword(request.getParameter("password"));
			
			System.out.println("rec.getTitle()"+rec.getTitle());
			System.out.println("rec.getContent()"+rec.getContent());
			System.out.println("rec.getArticleId()"+ rec.getArticleId());
			System.out.println("rec.getPassword()" + rec.getPassword());
			
			//ps.setString(1, rec.getTitle());
			//ps.setString(2, rec.getContent());
			//ps.setInt(3, rec.getArticleId());
			//ps.setString(4, rec.getPassword());
			
			int resultCnt = BoardDao.getInstance().update(rec);
			
			request.setAttribute("resultModify", resultCnt);
		}catch( BoardException ex ){
			throw new BoardCommandException("CommandDelete.java < 삭제시 > " + ex.toString() ); 
		}
		
		return next;			
	}

}
