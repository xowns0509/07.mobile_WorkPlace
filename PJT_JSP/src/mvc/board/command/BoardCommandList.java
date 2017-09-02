package mvc.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;
import mvc.board.model.BoardRec;

public class BoardCommandList implements BoardCommand{
	private String next;
	
	public BoardCommandList(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws BoardCommandException {
		 
		try {
			List <BoardRec> mList = BoardDao.getInstance().selectList();
			request.setAttribute("param", mList);
			
		} catch (BoardException e) {
			throw new BoardCommandException("BoardCommandList.java<목록보기>: "+e.getMessage());
		}
		
		return next;
	}

}
