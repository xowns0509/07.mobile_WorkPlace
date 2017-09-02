package mvc.board.command;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;
import mvc.board.model.BoardRec;



public class BoardCommandView implements BoardCommand{
	private String next;
	
	public BoardCommandView(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws BoardCommandException {
		try{
			
			int article_id = 0;
			String id=request.getParameter("articleId");
			System.out.println("articleId"+id);
			if( id != null ) 
				article_id = Integer.parseInt(id);
			
			BoardDao.getInstance().increaseReadCount(id);
			BoardRec rec = BoardDao.getInstance().selectById(article_id);		
			
			System.out.println("rec.getArticleId(): "+rec.getArticleId());
			
			request.setAttribute("postResult", rec);//내가 추가한거

		}catch(BoardException e){
			throw new BoardCommandException("CommandWirte.java <입력시>: "+e.getMessage());
		}
		return next;
	}
}
