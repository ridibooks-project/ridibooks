package book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookService {
	
	int statusCode;
	
	// 도서검색
	public int Search(HttpServletRequest request, HttpServletResponse response) {
		String search = request.getParameter("q");
		
		// 공백제거
		search.trim();
		
		if(search == null || search.isEmpty()) {
			// return statusCode = HttpServletResponse.SC_NOT_FOUND;
			return statusCode;
		}
		
		BookDAO dao = new BookDAO();
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		bookList = dao.bookSearch(search);
		
		for(BookDTO book : bookList) {
			request.setAttribute("name", book.getBook_name());
		}
		
		System.out.println(request.getAttribute("name"));
		
		try {
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			
			out.print("location.href=\"http://localhost/ridibooks.com/search.jsp?q="+search+"\"");
			
			out.print("</script>");
			
			out.close();
		} catch (IOException e) {
			// e.printStackTrace();
			System.out.println("언제뜨는 에러인지 확인 중");
		}
		
		
		return statusCode;
	}
}
