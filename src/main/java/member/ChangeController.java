package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/change/controller")
public class ChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 이메일 변경
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.changeEmail(request, response);
		
		response.setStatus(statusCode);
	}

	// 비밀번호 변경
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.changePw(request, response);
		
		response.setStatus(statusCode);
	}
}
