package noti;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NoticeDAO {
	// 서버 접속
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/maria/rdbooks");
			
			conn = ds.getConnection();
			
			return conn;
		} catch(NamingException e) {
//					e.printStackTrace();
			System.out.println("Connection Pool 관련 예외 발생");
		} catch (SQLException e) {
//					e.printStackTrace();
			System.out.println("Conncetion 예외 발생");
		}
		return null;
	}
	
	// 내 알림 불러오기
	public ArrayList<NoticeDTO> notice(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		
		try {
			conn = getConnection();
			String sql = "SELECT noti_no, noti_title, noti_text, noti_date, noti_status "
					+ "FROM notification "
					+ "INNER JOIN memberinfo ON memberinfo.id_no = notification.id_no "
					+ "WHERE member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				
				notice.setNoti_no(rs.getInt("noti_no"));
				notice.setNoti_title(rs.getString("noti_title"));
				notice.setNoti_text(rs.getString("noti_text"));
				notice.setNoti_date(rs.getTimestamp("noti_date").toLocalDateTime());
				notice.setNoti_status(rs.getInt("noti_status"));
				
				noticeList.add(notice);
				
				System.out.println(notice.getNoti_date());
			}
			
		} catch(SQLException e) {
//						e.printStackTrace();
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
		return noticeList;
	}
	
	// 알림 status 변경(신규 -> 읽음) 테스트 필요
	public boolean noticeStatus(String id, int noti_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		boolean update = false;
		
		try {
			conn = getConnection();
			
			String sql = "UPDATE notification SET noti_status = 1 WHERE member_id = ? AND noti_no = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, noti_no);
			
			int count = pstmt.executeUpdate();
			
			update = count == 1;
			
		} catch(SQLException e) {
	//		e.printStackTrace();
			System.out.println("SQL 예외");
		} finally {
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
		return update;
	}
	
}
