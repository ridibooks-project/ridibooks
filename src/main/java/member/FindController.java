package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/find/controller")
public class FindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 아이디 찾기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = new MemberService();
		int statusCode = service.findId(request, response);
		
		System.out.println(statusCode);
		
		response.setStatus(statusCode);
		
	}

	// 비밀번호 재설정
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = new MemberService();
		int statusCode = service.findPw(request, response);
		
		System.out.println(statusCode);
		
		response.setStatus(statusCode);

	}
}
