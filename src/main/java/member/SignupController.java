package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 회원가입 컨트롤러
@WebServlet("/signup/controller")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 회원가입
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberService service = new MemberService();
		int statusCode = service.joinMember(request, response);
		
		System.out.println(statusCode);
		
<<<<<<< HEAD
		response.setStatus(statusCode);
		
//		if(statusCode == 201) {
//			// 회원가입 성공했을 때
//			response.sendRedirect("http://localhost/ridibooks.com");
//		} else if(statusCode == 400) {
//			// 회원가입 실패했을 때
//			response.sendRedirect("http://localhost/ridibooks.com/account/signup.jsp");
//		} else {
//			// 회원가입 실패했을 때 - 404
//			response.sendRedirect("http://localhost/ridibooks.com/account/signup.jsp");
//		}
=======
		if(statusCode == 201) {
			// 회원가입 성공했을 때
			response.sendRedirect("http://localhost/ridibooks.com");
		} else if(statusCode == 400) {
			// 회원가입 실패했을 때
			response.sendRedirect("http://localhost/ridibooks.com/account/signup.jsp");
		} else {
			// 회원가입 실패했을 때 - 404
			response.sendRedirect("http://localhost/ridibooks.com/signup.jsp");
		}
>>>>>>> 630ce357bc3daa2c87f4054eb07c05823f55129f
	}
}
