package mvc.board.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.command.BoardCommand;
import mvc.board.command.BoardCommandException;
import mvc.board.command.BoardCommandList;
import mvc.board.command.BoardCommandModify;
import mvc.board.command.BoardCommandNull;
import mvc.board.command.BoardCommandView;

public class BoardControl extends HttpServlet {
	private HashMap commandMap;
	private String jspDir = "/04_board_mvc/";
	private String error = "imgs/error.jsp";

	public BoardControl() {
		super();
		initCommand();
	}

	private void initCommand() {
		commandMap = new HashMap();
		// ###############
		commandMap.put("main-page", new BoardCommandNull("main.jsp"));
		commandMap.put("list-page", new BoardCommandList("BoardList.jsp"));
		//게시글 보기
		commandMap.put("show-form", new BoardCommandView("BoardView.jsp"));
		//수정 form 및 확인
		commandMap.put("modify-form", new BoardCommandView("BoardModifyForm.jsp"));
		commandMap.put("modify-page", new BoardCommandModify("BoardModify.jsp"));
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey = request.getParameter("cmd");
		if (cmdKey == null) {
			cmdKey = "main-page";
		}

		BoardCommand cmd = null;

		try {

			if (commandMap.containsKey(cmdKey.toLowerCase())) {
				cmd = (BoardCommand) commandMap.get(cmdKey.toLowerCase());
			} else {
				throw new BoardCommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute(request);

		} catch (BoardCommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			nextPage = error;
			System.out.println("오류 : " + e.getMessage());
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
		reqDp.forward(request, response);
		//forward는 넘겨주는거 
	}
}
