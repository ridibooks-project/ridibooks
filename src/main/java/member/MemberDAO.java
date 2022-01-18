package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MemberDAO {
	// 서버 접속
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/maria/rdbooks");
			
			conn = ds.getConnection();
			
			return conn;
		} catch(NamingException e) {
//			e.printStackTrace();
			System.out.println("Connection Pool 관련 예외 발생");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Conncetion 예외 발생");
		}
		return null;
	}
	
	// db 정보 조회 - id를 이용해 회원 조회
	public String selectMemberById(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String db_pw = "";
		
		try {
			conn = getConnection();
			// 입력한 id와 status(회원상태)가 0(정상)일 때를 조회
			String sql = "SELECT member_pw FROM memberinfo WHERE member_id = ? AND m_status = 0";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_pw = rs.getString("member_pw");
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
		// db의 비밀번호 값 리턴 / 없으면 "" 리턴
		return db_pw;
	}
	
	// db 로그인date 추가
	public boolean updateLoginDate(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		boolean insertDate = false;
		
		try {
			conn = getConnection();
			
			String sql = "UPDATE memberinfo SET login_date = ? WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setTimestamp(1, Timestamp.valueOf(member.getLogin_date()));
			pstmt.setString(2, member.getId());
			
			int count = pstmt.executeUpdate();
			
			insertDate = count == 1;
			
		} catch(SQLException e) {
//			e.printStackTrace();
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
		// 성공적으로 추가되었다면 true / 아니면 false 리턴
		return insertDate;
	}
	
	
	// db 정보 추가 - 회원가입
	public boolean insertMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		boolean signup = false;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT INTO memberinfo(member_id, member_pw, member_email, member_name, year, gender, marketing_agree, select_agree, signup_date) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getYear());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getMarketing_agree());
			pstmt.setString(8, member.getSelect_agree());
			pstmt.setTimestamp(9, Timestamp.valueOf(member.getSignup_date()));
			
			int count = pstmt.executeUpdate();
			
			signup = count == 1;
			
		} catch(SQLException e) {
//			e.printStackTrace();
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
		return signup;
	}
	
	// db 정보 수정
	public boolean updateMember(MemberDTO member) {
		return false;
	}
	
	// db 정보 삭제 - 회원탈퇴
	public boolean deleteMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		boolean delete = false;
		
		try {
			conn = getConnection();
			
			String sql = "UPDATE memberinfo SET m_status = 1 WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setTimestamp(1, Timestamp.valueOf(member.getLogin_date()));
			pstmt.setString(2, member.getId());
			
			int count = pstmt.executeUpdate();
			
			delete = count == 1;
			
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
		// 성공적으로 추가되었다면 true / 아니면 false 리턴
		return delete;
	}

	// db 정보 조회 - email를 이용해 회원 조회
	public String checkMemberByEmail(MemberDTO member) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String db_id = "";
		
		try {
			conn = getConnection();
			
			String sql = "SELECT member_id FROM memberinfo WHERE member_email = ? AND m_status = 0";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_id = rs.getString("member_id");
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
		return db_id;
	}
	
	// db pw재설정 
	public boolean updatePw(MemberDTO member) {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		boolean update = false;
		
		try {
			conn = getConnection();
			
			String sql = "UPDATE memberinfo SET member_pw = ? WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getId());
			
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
	
	// 아이디 중복 확인
	public boolean checkId(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String db_id = "";
		boolean checkId = false;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT member_id FROM memberinfo WHERE member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_id = rs.getString("member_id");
				
				if(db_id.equals(member.getId())) {
					// db에 입력한 아이디와 같은 값이 있다면 true 반환
					checkId = true;
				}
			}
			rs.close();
			
		} catch(SQLException e) {
//			e.printStackTrace();
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
		return checkId;
	}
	
	// 이메일 중복 확인
		public boolean checkEmail(MemberDTO member) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String db_email = "";
			boolean checkEmail = false;
			
			try {
				conn = getConnection();
				
				String sql = "SELECT member_email FROM memberinfo WHERE member_email = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getEmail());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					db_email = rs.getString("member_email");
					
					if(db_email.equals(member.getEmail())) {
						// db에 입력한 아이디와 같은 값이 있다면 true 반환
						checkEmail = true;
					}
				}
				rs.close();
				
			} catch(SQLException e) {
//				e.printStackTrace();
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
			return checkEmail;
		}
	
}
