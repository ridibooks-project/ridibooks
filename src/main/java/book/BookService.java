package book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookService {
	
	int statusCode;
	
	// 도서검색
	
	// rd테스트
//	public ArrayList<BookDTO> Search(HttpServletRequest request, HttpServletResponse response) {
//	// public int Search(HttpServletRequest request, HttpServletResponse response) {
//		
//		String search = request.getParameter("q");
//		
//		// 공백제거
//		search.trim();
//		
//		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
//		
//		if(search == null || search.isEmpty() || search.equals("")) {
//			 // return statusCode = HttpServletResponse.SC_NOT_FOUND;
//			 
//			 // rd테스트
//			 return bookList;
//		}
//		
//		BookDAO dao = new BookDAO();
//		
//		bookList = dao.bookSearch(search);
//		
//		request.setAttribute("bookList", bookList);
//		
//		for(BookDTO book : bookList) {
//			request.setAttribute("name", book.getBook_name());
//			request.setAttribute("buy", book.getBuyprice());
//			request.setAttribute("rent", book.getRentprice());
//			request.setAttribute("img", book.getBook_image());
//			request.setAttribute("introduction", book.getIntroduction());
//			System.out.println("---");
//			System.out.println(request.getAttribute("name"));
//			System.out.println(request.getAttribute("buy"));
//			System.out.println(request.getAttribute("rent"));
//			System.out.println(request.getAttribute("img"));
//			System.out.println(request.getAttribute("introduction"));
//			System.out.println("---");
//		}
//		
//		try {
//			
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=UTF-8");
//			
//			PrintWriter out = response.getWriter();
//			
//			out.print("<script>");
//			
//			out.print("location.href=\"http://localhost/ridibooks.com/search.jsp?q="+search+"\"");
//			
//			out.print("</script>");
//			
//			out.close();
//		} catch (IOException e) {
//			// e.printStackTrace();
//			System.out.println("언제뜨는 에러인지 확인 중");
//		}
//		
//		// return statusCode;
//		
//		return bookList;
//	}
}
