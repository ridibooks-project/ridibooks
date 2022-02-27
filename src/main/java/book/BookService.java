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
		
		return bookList;
	}
	
	// 카트 불러오기
	public ArrayList<BookDTO> cart(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
	
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
	
		BookDAO dao = new BookDAO();
	
		bookList = dao.cart(id);
	
		return bookList;
	}
	
	// 신간 불러오기
	public ArrayList<BookDTO> newList(HttpServletRequest request, HttpServletResponse response) {
		
	
		ArrayList<BookDTO> newList = new ArrayList<BookDTO>();
	
		BookDAO dao = new BookDAO();
	
		newList = dao.newList();
	
		return newList;
	}
	
	// 금 주 신간 불러오기
	public ArrayList<BookDTO> newWeekList(HttpServletRequest request, HttpServletResponse response) {
		
	
		ArrayList<BookDTO> newList = new ArrayList<BookDTO>();
	
		BookDAO dao = new BookDAO();
	
		newList = dao.newWeekList();
	
		return newList;
	}
	
	// 베스트셀러 불러오기
	public ArrayList<BookDTO> bestList(HttpServletRequest request, HttpServletResponse response) {
		
	
		ArrayList<BookDTO> newList = new ArrayList<BookDTO>();
	
		BookDAO dao = new BookDAO();
	
		newList = dao.bestList();
	
		return newList;
	}
	
}
