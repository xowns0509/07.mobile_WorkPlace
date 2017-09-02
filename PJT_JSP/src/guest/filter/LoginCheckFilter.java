package guest.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/LoginCheckFilter")
public class LoginCheckFilter implements Filter {

	public LoginCheckFilter() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpRes = (HttpServletResponse) response;

		// 아래 if절의 session은 얻어와야 함.
		HttpSession session = httpReq.getSession();

		// 로그인 확인
		// 로그인 했는지 어떻게 알어?

		boolean login = false;

		if (session != null && session.getAttribute("login") != null) {
			login = true;

		}
		if (login) {
			// 로그인 한 상태라면 (세션에 로그인이 저장된 상태라면)
			// 원래 호출 한 상태로 넘겨주기
			// 그러나 로그인 상태가 아니면 페이지를 사용자 모르게 forwarding
			// 
			chain.doFilter(request, response);
		} else {// <jsp:forward>

			String loginPage = "/01_basic_class/5_session/01_login/LoginForm.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(loginPage);
			// d여기다 나갈 경로를 지정
			disp.forward(request, response);

		}

	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
