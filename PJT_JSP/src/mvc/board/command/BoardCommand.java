package mvc.board.command;

import javax.servlet.http.HttpServletRequest;


public interface BoardCommand {
	public String execute( HttpServletRequest request ) throws BoardCommandException;
}
