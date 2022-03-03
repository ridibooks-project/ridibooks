package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/event/controller")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MainService service = new MainService();
		
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		
		eventList = service.event(request, response);
		
		int statusCode;
		
		if(eventList.size() == 0) {
			statusCode = HttpServletResponse.SC_NOT_FOUND;
		}
		
		request.setAttribute("eventList", eventList);
		
		statusCode = HttpServletResponse.SC_OK;

		response.setStatus(statusCode);
	}
}
