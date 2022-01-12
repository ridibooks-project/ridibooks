package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;

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
	
	// db 정보 조회 - 로그인
	
	// 코드 수정 필요
	// 1. MemberService 로 가서 비밀번호를 체크하지 말고 여기서 체크하고
	//    체크 후 맞는지 아닌지 결과 값을 return
	// 2. 만약 비밀번호가 맞으면 db에서 해당 id의 login_date 값을 수정하는 코드 추가
	public boolean selectMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean login = false;
		
		String db_pw = "";
		String db_status = "";
		
		try {
			conn = getConnection();
			
			String sql = "SELECT member_pw, status FROM memberinfo WHERE member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_pw = rs.getString("member_pw");
				db_status = rs.getString("status");
				
				if(db_status.equals("0")) {
					// db_status가 0 일 때 (회원상태가 정상 일 때)
					if(db_pw.equals(member.getPw())) {
						
						sql = "UPDATE memberinfo SET login_date = ?";
						
						PreparedStatement pstmt2 = conn.prepareStatement(sql);
						pstmt2.setTimestamp(1, Timestamp.valueOf(member.getLogin_date()));
						
						login = true;
						
						pstmt2.close();
					}
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
		return login;
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
			
			// executeUpdate() 값이 얼마인지 확인할 것
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
		ResultSet rs = null;
		
		boolean delete = false;
		
		String db_pw = "";
		
		try {
			conn = getConnection();
			
			String sql = "SELECT member_pw FROM memberinfo WHERE member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_pw = rs.getString("member_pw");
				
				if(db_pw.equals(member.getPwChk())) {
						
					// 회원상태(status) 1이 탈퇴상태 이니 1 입력
					sql = "UPDATE memberinfo SET status = 1";
					PreparedStatement pstmt2 = conn.prepareStatement(sql);
					
					delete = true;
					
					pstmt2.close();
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
		return delete;
	}
	
	// db - id찾기
	public String findId(MemberDTO member) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String db_id = "";
		String db_status = "";
		
		try {
			conn = getConnection();
			
			String sql = "SELECT member_id, status FROM memberinfo WHERE member_email = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_status = rs.getString("status");
				
				if(db_status.equals("0")) {
					// db_status가 0 일 때 (회원상태가 정상 일 때)
					
					db_id = rs.getString("member_id");
					
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
		return db_id;
	}
	
	// db - pw찾기-1 (아이디, 이메일로 회원가입 여부 확인)
	public String findPw(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String db_status = "";
		String newPw = "";
		
		try {
			conn = getConnection();
			
			String sql = "SELECT member_id, status FROM memberinfo WHERE member_email = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_status = rs.getString("status");
				
				// db_status가 0 일 때 (회원상태가 정상 일 때)
				if(db_status.equals("0")) {

					// 입력한 id랑 db의 id가 같다면
					if(member.getId().equals(rs.getString("member_id"))) {
						
						// 임시 비밀번호 발급
						Random random = new Random();
						
						StringBuffer tempPw = new StringBuffer();
						// 임시 비밀번호 10자리로 지정
						for(int i=0; i<10; i++) {
							// 숫자,영문대문자,영문소문자 3개지를 랜덤으로
							int j = random.nextInt(3);
							switch(j) {
							// j가 0일 때 숫자 출력		// 0~9
							case 0:
								tempPw.append((random.nextInt(10)));
								break;
							// j가 1일 때 소문자 출력		// 아스키코드 97~122 -> a-z
							case 1:
								tempPw.append((char) ((int) (random.nextInt(26))+97 ));
								break;
							// j가 2일 때 대문자 출력		// 아스키코드 65~90 -> A-Z
							case 2:
								tempPw.append((char) ((int) (random.nextInt(26))+65 ));
								break;
							}
						}
						
						newPw = tempPw.toString();
						member.setPw(newPw);
						
						sql = "UPDATE memberinfo SET member_pw = ? WHERE member_id = ?";
						PreparedStatement pstmt2 = conn.prepareStatement(sql);
						pstmt2.setString(1, member.getPw());
						pstmt2.setString(2, member.getId());
						
						pstmt2.executeUpdate();
						
						pstmt2.close();
						
					}
					
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
		
		return newPw;
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
