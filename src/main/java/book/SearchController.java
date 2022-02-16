package book;

import java.io.IOException;
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
		int statusCode = service.Search(request, response);
		
		response.setStatus(statusCode);
		
	}
}
