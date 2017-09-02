package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 프로젝트 명이라 폴더명은 변수 잡고 시작해라.
	String jspDir = "/05_mvc_class/1_mvcSimple/";
	// 여기서 절대경로를 쓰면 웹 컨텐츠 부터 시작

	// Get방식이라면 이놈.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		processRequest(request, response);
	}

	// Post방식이라면 이놈
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");

		String value = "";
		if (type == null)
			value = "안녕하세요";

		else if (type.equals("first"))
			value = "홍길동님 화이팅!";

		request.setAttribute("param", value);

		// <jsp:forward page="simpleView.jsp"/>
		RequestDispatcher disp = request.getRequestDispatcher(jspDir + "simpleView.jsp");
		disp.forward(request, response);
		// 괄호 안에 넘어가고 싶은 페이지 기술
	}
}
