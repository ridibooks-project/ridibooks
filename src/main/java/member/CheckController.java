package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckController
 */
@WebServlet("/check/controller")
public class CheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 아이디 중복 확인
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.checkId(request, response);
		
		// statusCode 값 상관없이 회원가입 페이지로 돌아간 후 statusCode 값에 따라 안내문 출력하기 위해 session에 저장
		
		HttpSession session = request.getSession();
		session.setAttribute("checkId", statusCode);
		
		System.out.println(session.getAttribute("checkId"));
	}

	// 이메일 중복 확인
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.checkEmail(request, response);
		
		HttpSession session = request.getSession();
		session.setAttribute("checkEmail", statusCode);
		
		System.out.println(session.getAttribute("checkEmail"));
	}
}
