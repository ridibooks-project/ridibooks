package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDAO {
	// 서버 접속
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/maria/rdbooks");
			
			conn = ds.getConnection();
			
			return conn;
		} catch(NamingException e) {
//				e.printStackTrace();
			System.out.println("Connection Pool 관련 예외 발생");
		} catch (SQLException e) {
//				e.printStackTrace();
			System.out.println("Conncetion 예외 발생");
		}
		return null;
	}
	
	// 도서 검색 - 제목만 검색?
	// 저자, 출판사 검색은?
	public ArrayList<BookDTO> bookSearch(String search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM bookinfo WHERE book_name LIKE ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDTO book = new BookDTO();
				
				book.setBook_no(rs.getInt("book_no"));
				book.setBook_name(rs.getString("book_name"));
				book.setBook_image(rs.getString("book_image"));
				book.setBuyprice(rs.getInt("buyprice"));
				book.setRentprice(rs.getInt("rentprice"));
				book.setIntroduction(rs.getString("introduction"));
//				book.setCategory_no(rs.getInt(7));
				
				bookList.add(book);
			}
			
		} catch(SQLException e) {
//			e.printStackTrace();
			System.out.println("SQL 예외");
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bookList;
	}
	
	// 내 카트 불러오기
	public ArrayList<BookDTO> cart(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			conn = getConnection();
			String sql = "SELECT book_name, book_image, buyprice "
					+ "FROM cart "
					+ "INNER JOIN memberinfo ON memberinfo.id_no = cart.id_no "
					+ "INNER JOIN bookinfo ON bookinfo.book_no = cart.book_no "
					+ "WHERE member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDTO book = new BookDTO();
				
				book.setBook_name(rs.getString("book_name"));
				book.setBook_image(rs.getString("book_image"));
				book.setBuyprice(rs.getInt("buyprice"));
				
				bookList.add(book);
			}
			
		} catch(SQLException e) {
//					e.printStackTrace();
			System.out.println("SQL 예외");
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bookList;
	}
	
	// 신작 불러오기 - 테스트 중
	public ArrayList<BookDTO> newList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			conn = getConnection();
			
			String sql = "SELECT * FROM bookinfo ORDER BY book_date DESC";	// LIMIT 10
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BookDTO book = new BookDTO();
				
				book = new BookDTO();
				
				book.setBook_name(rs.getString("book_name"));
				book.setBook_no(rs.getInt("book_no"));
				book.setBook_image(rs.getString("book_image"));
				book.setBuyprice(rs.getInt("buyprice"));
				book.setRentprice(rs.getInt("rentprice"));
				book.setIntroduction(rs.getString("introduction"));
				book.setCategory_no(rs.getInt("category_no"));
				
				bookList.add(book);
			}
			
		} catch(SQLException e) {
//			e.printStackTrace();
			System.out.println("SQL 예외");
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bookList;
	}
	
	// 금 주 신작 불러오기 - 테스트 중
	public ArrayList<BookDTO> newWeekList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			conn = getConnection();
			
			String sql = "";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BookDTO book = new BookDTO();
				
				book = new BookDTO();
				
				book.setBook_name(rs.getString("book_name"));
				book.setBook_no(rs.getInt("book_no"));
				book.setBook_image(rs.getString("book_image"));
				book.setBuyprice(rs.getInt("buyprice"));
				book.setRentprice(rs.getInt("rentprice"));
				book.setIntroduction(rs.getString("introduction"));
				book.setCategory_no(rs.getInt("category_no"));
				
				bookList.add(book);
			}
			
		} catch(SQLException e) {
//				e.printStackTrace();
			System.out.println("SQL 예외");
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bookList;
	}

	// 베스트셀러 불러오기 - 테스트 중
	public ArrayList<BookDTO> bestList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			conn = getConnection();
			
			String sql = "";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BookDTO book = new BookDTO();
				
				book = new BookDTO();
				
				book.setBook_name(rs.getString("book_name"));
				book.setBook_no(rs.getInt("book_no"));
				book.setBook_image(rs.getString("book_image"));
				book.setBuyprice(rs.getInt("buyprice"));
				book.setRentprice(rs.getInt("rentprice"));
				book.setIntroduction(rs.getString("introduction"));
				book.setCategory_no(rs.getInt("category_no"));
				
				bookList.add(book);
			}
			
		} catch(SQLException e) {
//					e.printStackTrace();
			System.out.println("SQL 예외");
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bookList;
	}
}
