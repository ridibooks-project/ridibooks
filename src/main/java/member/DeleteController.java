package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete/controller")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = new MemberService();
		int statusCode = service.deleteMember(request, response);
		
		response.setStatus(statusCode);
		
		if(statusCode == 200) {
			// 회원탈퇴 성공했을 때
			response.sendRedirect("리디북스 홈");
		} else {
			// 회원탈퇴 실패했을 때 - 400
			response.sendRedirect("회원탈퇴하는페이지");
		}
	}
}
