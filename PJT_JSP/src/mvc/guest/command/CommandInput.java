package mvc.guest.command;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import mvc.guest.model.Message;
import mvc.guest.model.MessageDao;
import mvc.guest.model.MessageException;

public class CommandInput implements Command {
	private String next;

	public CommandInput( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		try{

			Message msg = new Message();
			msg.setGuestName( request.getParameter("guestName"));
			msg.setPassword(request.getParameter("password"));
			msg.setMessage( request.getParameter("message"));
			
			MessageDao.getInstance().insert(msg);
			
		}catch( MessageException ex ){
			throw new CommandException("CommandInput.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}
