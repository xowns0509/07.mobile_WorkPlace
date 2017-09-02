package temp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServelt
 */
//@WebServlet("/FirstServelt")// 골뱅이: 어노테이션
//서블릿 클래스가 되려면 HttpServlet를 상속받으면 됨.
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FirstServlet() {
        super();
    }
    
    // method: get 방식인 경우 호출(default)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//request. response
    	response.setContentType("text/html;charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	out.write("<html>");//클라이언트에게 전달
    	out.write("<head><title>첫페이지 </title></head>");//클라이언트에게 전달
    	out.write("<body>");
    	out.write("어려운 웹 서버 프로그램.");
    	out.write("</body>");
    	out.write("</html>");
    	out.close();
	}
    
    // method: post방식인 경우 호출
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
