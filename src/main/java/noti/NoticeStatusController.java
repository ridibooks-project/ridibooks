package noti;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/notice/status/controller")
public class NoticeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noti_status = Integer.parseInt(request.getParameter("status"));
		int noti_no = Integer.parseInt(request.getParameter("page"));
		
		int statusCode;
		
		if(noti_status == 0) {
			// 신규 알림일 때
			NoticeService service = new NoticeService();
			
			statusCode = service.noticeStatus(request, response);
			
		} else {
			// 이미 읽은 알림일 때
			statusCode = HttpServletResponse.SC_OK;
		}

		if(statusCode==200) {
			response.sendRedirect("http://localhost/ridibooks.com/event/page"+noti_no+".jsp");
		} else {
			response.sendRedirect("http://localhost/ridibooks.com/account/notice.jsp");
		}
	}
}
