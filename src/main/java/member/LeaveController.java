package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/leave/controller")
public class LeaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// 회원 탈퇴
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		// 탈퇴를 위한 비밀번호 확인
		int statusCode = service.confirmPw(request, response);
		
		if(statusCode == 200) {
			// 확인 완료시 탈퇴 진행
			statusCode = service.deleteMember(request, response);
		}
		
		response.setStatus(statusCode);
	}
}
