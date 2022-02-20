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
		
		// BookService service = new BookService();
		// int statusCode = service.Search(request, response);
		// response.setStatus(statusCode);
		
		
		// rd로 전달 테스트
//		ArrayList<BookDTO> bookList = service.Search(request, response);
		
		String search = request.getParameter("q");
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		BookDAO dao = new BookDAO();
		
		bookList = dao.bookSearch(search);
		
		request.setAttribute("bookList", bookList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/http://localhost/ridibooks.com/search.jsp");
		rd.forward(request, response);
		
	}
}
