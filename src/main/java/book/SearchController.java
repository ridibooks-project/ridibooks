package book;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search/controller")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 도서 검색
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookService service = new BookService();
		
		ArrayList<BookDTO> bookList = service.search(request, response);
		
		request.setAttribute("bookList", bookList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
		rd.forward(request, response);
		
	}
}
