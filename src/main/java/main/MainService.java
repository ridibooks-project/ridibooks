package main;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainService {

	// 리턴할 http 응답코드
		int statusCode;
		
	// 로그인
	public ArrayList<EventDTO> event(HttpServletRequest request, HttpServletResponse response) {
		
		MainDAO dao = new MainDAO();
		
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		
		eventList = dao.event();
		
		return eventList;
	}
}
