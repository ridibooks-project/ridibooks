package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/check/controller")
public class CheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 아이디 중복 확인
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.checkId(request, response);
		
		response.setStatus(statusCode);
		
	}

	// 이메일 중복 확인
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.checkEmail(request, response);
		
		response.setStatus(statusCode);

	}
}
