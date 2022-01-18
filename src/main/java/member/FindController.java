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
		
//		response.setStatus(statusCode);
		
		if(statusCode == 200) {
			// 회원탈퇴 성공했을 때
			
			
//			PrintWriter out = response.getWriter();
//			
//			out.close();

			response.sendRedirect("http://localhost/ridibooks.com/account/testview.jsp");
		} else {
			// 회원탈퇴 실패했을 때 - 400
			response.sendRedirect("http://localhost/ridibooks.com/account/findID.jsp");
		}
		
	}

	// 비밀번호 재설정
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = new MemberService();
		int statusCode = service.findPw(request, response);
		
		System.out.println(statusCode);
		
//		response.setStatus(statusCode);
		
		if(statusCode == 200) {
			// 회원탈퇴 성공했을 때
			
			
//			PrintWriter out = response.getWriter();
//			
//			out.close();

			response.sendRedirect("http://localhost/ridibooks.com/account/testview.jsp");
		} else {
			// 회원탈퇴 실패했을 때 - 400
			response.sendRedirect("http://localhost/ridibooks.com/account/findPW.jsp");
		}
	}
}
