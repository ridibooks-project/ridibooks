package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/confirm/login/controller")
public class ConfirmLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int i = Integer.parseInt(request.getParameter("page"));
		HttpSession session = request.getSession();
		
		if(session.getAttribute("isLogin") == null || session.getAttribute("isLogin").equals(false)) {
			
			response.sendRedirect("http://localhost/ridibooks.com/account/login.jsp");
		} else {
			//if(i==1) response.sendRedirect("http://localhost/ridibooks.com/account/notice.jsp");
			if(i==1) response.sendRedirect("http://localhost/ridibooks.com/notice/controller");
			if(i==2) response.sendRedirect("http://localhost/ridibooks.com/cart/controller");
       		if(i==3) response.sendRedirect("http://localhost/ridibooks.com/account/myridi.jsp");
		}
	}
}
