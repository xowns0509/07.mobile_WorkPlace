package mvc.board.command;

import javax.servlet.http.HttpServletRequest;

public class BoardCommandNull implements BoardCommand{
	private String next;

	public BoardCommandNull( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws BoardCommandException{
		return next;
	}

}