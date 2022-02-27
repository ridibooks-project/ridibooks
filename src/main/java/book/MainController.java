package book;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// 신간, 금주신간 베스트셀러 등 메인페이지에 보이는 책들
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookService service = new BookService();
		
		ArrayList<BookDTO> NewList = service.newList(request, response);
		ArrayList<BookDTO> NewWeekList = service.newWeekList(request, response);
		ArrayList<BookDTO> BestList = service.bestList(request, response);
		
		request.setAttribute("NewList", NewList);
		request.setAttribute("NewWeekList", NewWeekList);
		request.setAttribute("BestList", BestList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/frontController.jsp");
		rd.forward(request, response);
	}

}
