package noti;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoticeService {
	
public ArrayList<NoticeDTO> notice(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
	
		ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
	
		NoticeDAO dao = new NoticeDAO();
	
		noticeList = dao.notice(id);
		
		// 알림 받은 시간 계산
		LocalDateTime ldt = LocalDateTime.now();
		
		System.out.println(ldt);
		
		
		for(int i=0; i<noticeList.size(); i++) {
			Duration duration = Duration.between(noticeList.get(i).getNoti_date(), ldt);
			noticeList.get(i).setDuration(duration.getSeconds() / 3600);
		}
	
		session.setAttribute("mynoti", noticeList);
	
		return noticeList;
	}

}
