package book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookService {
	
	// 도서검색
	public ArrayList<BookDTO> search(HttpServletRequest request, HttpServletResponse response) {
		
		String search = request.getParameter("q");
		
		// 공백제거
		search.trim();
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		if(search == null || search.isEmpty() || search.equals("")) {
			 
			return bookList;
		}
		
		BookDAO dao = new BookDAO();
		
		bookList = dao.bookSearch(search);
		
		//request.setAttribute("bookList", bookList);
		
		return bookList;
	}
	
	// 카트 불러오기
	public ArrayList<BookDTO> cart(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
	
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
	
		BookDAO dao = new BookDAO();
	
		bookList = dao.cart(id);
	
		session.setAttribute("mycart", bookList);
	
		return bookList;
	}
	
}
