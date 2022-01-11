package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/controller")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 로그인
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		int statusCode = service.loginMember(request, response);
		
		if(statusCode == 200) {
			// 로그인 성공했을 때
			response.sendRedirect("/ridibooks/html/index.html");
		} else {
			// 로그인 실패했을 때(Not Found)
			response.sendRedirect("/ridibooks/account/login.jsp");
		}
	}
	// 가입, 수정, 탈퇴도 post 메서드로 받으니 controller를 따로 만들 것
}
