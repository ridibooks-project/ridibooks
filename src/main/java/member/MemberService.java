package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberService {
	
	// 리턴할 http 응답코드
	int statusCode;
	
	// 로그인
	public int loginMember(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		String stay_login = request.getParameter("stay_login");
		
		// 아이디 또는 비밀번호가 null이거나 공백일경우
		if( (id.isEmpty() || id == null) || (pw.isEmpty() || pw == null) ) {
			
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			
			return statusCode;
		}
		
		LocalDateTime ldt = LocalDateTime.now();
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setPw(pw);
		member.setLogin_date(ldt);
		
		MemberDAO dao = new MemberDAO();
		String db_pw = dao.selectMemberById(member);
		
		if(db_pw.equals(member.getPw())) {
			
			boolean insertDate = dao.updateLoginDate(member);
			
			if(!insertDate) {
				statusCode = HttpServletResponse.SC_BAD_REQUEST;
				
				return statusCode;
			}
			
			HttpSession session = request.getSession();
			
			session.setAttribute("isLogin", true);
			session.setAttribute("id", id);
			
			if(stay_login == null || stay_login.equals("N") || stay_login.isEmpty()) {
				// 로그인 상태유지 체크X
				session.setMaxInactiveInterval(3600);	// 1시간
			} else {
				// 로그인 상태유지 체크
				session.setMaxInactiveInterval(3600 * 24 * 3);	// 3일
			}
			statusCode = HttpServletResponse.SC_OK;
		} else {
			statusCode = HttpServletResponse.SC_NOT_FOUND;
		}
		
		return statusCode;
	}
	
	// 회원가입
	public int joinMember(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("sign_id");
		String pw = request.getParameter("sign_pw");
		String pwChk = request.getParameter("sign_pwChk");
		String email = request.getParameter("sign_email");
		String name = request.getParameter("sign_name");
		
		// null로 받으면 에러뜸 수정필요 -> 미입력 시 기본값을 0 으로
		// 추 후 int -> date로 바꿔볼 것
		// int year = Integer.parseInt(request.getParameter("sign_year"));
		
		String myear = request.getParameter("sign_year");
		if(myear==null || myear.isEmpty()) myear = "0";
		int year = Integer.parseInt(myear);
		
		String gender = request.getParameter("sign_gender");
		String marketing_agree = request.getParameter("marketing_agree");
		String select_agree = request.getParameter("select_agree");
		
		// 아이디 패턴 확인 - 5~20자 영문/숫자 입력
		String idPattern = "^.*(?=.*[0-9a-zA-Z])(?=^.{5,20}$).*$";
		if(!id.matches(idPattern)) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		// 비밀번호 패턴 확인 - 8자 이상, 영문/숫자/특수문자 중 2가지 이상 포함
		// 패턴1 - 숫자/영문/특수문자 모두 포함 8자 이상
		String pwPattern1 = "^.*(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!?@#$%^&*])(?=^.{8,}$).*$";	
		// 패턴2 - 숫자/영문 포함 8자 이상
		String pwPattern2 = "^.*(?=.*[0-9])(?=.*[a-zA-Z])(?=^.{8,}$).*$";
		// 패턴3 - 숫자/특수문자 포함 8자 이상
		String pwPattern3 = "^.*(?=.*[0-9])(?=.*[!?@#$%^&*])(?=^.{8,}$).*$";
		// 패턴4 - 영문/특수문자 포함 8자 이상
		String pwPattern4 = "^.*(?=.*[a-zA-Z])(?=.*[!?@#$%^&*])(?=^.{8,}$).*$";
		
		// 패턴 1~4 모두 아닐경우 리턴 (4중 하나라도 맞으면 통과)
		if(!pw.matches(pwPattern1) && !pw.matches(pwPattern2) && !pw.matches(pwPattern3) && !pw.matches(pwPattern4) ) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		// 비밀번호 입력 확인 - pw == Chk 확인
		if(!pw.equals(pwChk)) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		// 이메일 패턴 확인
		String emailPattern = "^[a-zA-Z0-9]*@[a-zA-Z]*+.[a-zA-Z]([.a-zA-Z]).*$";
		if(!email.matches(emailPattern)) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		// 이름 패턴 확인 - 2글자 이상의 한글,영어
		String namePattern = "^.*(?=.*[가-힣a-zA-Z])(?=^.{2,}$).*$";
		if(!name.matches(namePattern)) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		// 마케팅 수신동의 미체크 시 N 지정
		if(marketing_agree.isEmpty() || marketing_agree == null) {
			marketing_agree = "N";
		}
		
		// 선택동의 미체크 시 N 지정
		if(select_agree.isEmpty() || select_agree == null) {
			select_agree = "N";
		}
		
		// 성별 미체크 시 기본값 null 지정
		if(gender.isEmpty() || gender == null) {
			gender = null;
		}
		
		// 가입날짜 입력을 위해 현재시간 불러오기
		LocalDateTime ldt = LocalDateTime.now();
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setPw(pw);
		member.setEmail(email);
		member.setName(name);
		member.setYear(year);
		member.setGender(gender);
		member.setMarketing_agree(marketing_agree);
		member.setSelect_agree(select_agree);
		member.setSignup_date(ldt);
		
		MemberDAO dao = new MemberDAO();
		boolean signup = dao.insertMember(member);
		
		if(signup) {
			statusCode = HttpServletResponse.SC_CREATED;
		} else {
			statusCode = HttpServletResponse.SC_NOT_FOUND;
		}
		
		return statusCode;
	}
	
	// 이메일 변경
	public int changeEmail(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("id");
		String newEmail = request.getParameter("newEmail");
		
		if(newEmail.isEmpty() || newEmail == null) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		MemberDTO member = new MemberDTO();
		member.setId(loginId);
		member.setEmail(newEmail);
		
		MemberDAO dao = new MemberDAO();
		boolean update = dao.updateEmail(member);
		
		if(update) {
			statusCode = HttpServletResponse.SC_CREATED;
		} else {
			statusCode = HttpServletResponse.SC_NOT_FOUND;
		}
		
		return statusCode;
	}
	
	// 비밀번호 변경
	public int changePw(HttpServletRequest request, HttpServletResponse response) {
			
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("id");
		String pwChk = request.getParameter("pwChk");
		String newPw = request.getParameter("newPw");
		String newPwChk = request.getParameter("newPwChk");
			
		if(pwChk.isEmpty() || pwChk == null || newPw.isEmpty() || newPw == null || newPwChk.isEmpty() || newPwChk == null) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		if(!newPw.equals(newPwChk)) {
			return statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		
		MemberDTO member = new MemberDTO();
		member.setId(loginId);
		
		MemberDAO dao = new MemberDAO();
		String db_pw = dao.selectMemberById(member);
		
		if(db_pw.isEmpty() || db_pw == null) {
			return statusCode = HttpServletResponse.SC_NOT_FOUND;
		}
		
		if(db_pw.equals(db_pw)) {
			
			member.setPw(newPw);
			
			boolean update = dao.updatePw(member);
			
			if(update) {
				statusCode = HttpServletResponse.SC_CREATED;
			} else {
				statusCode = HttpServletResponse.SC_NOT_FOUND;
			}
		}
		
		
		return statusCode;
	}
	
	
	// 회원 탈퇴
	public int deleteMember(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("id");
		String delete_pwChk = request.getParameter("delete_pwChk");
		
		MemberDTO member = new MemberDTO();
		member.setId(loginId);
		
		MemberDAO dao = new MemberDAO();
		String db_pw = dao.selectMemberById(member);
		
		if(db_pw.equals(delete_pwChk)) {
			
			boolean delete = dao.deleteMember(member);
			if(delete) {
				statusCode = HttpServletResponse.SC_OK;
					
				session.invalidate();
			}
		}
		return statusCode;
	}
	
	// 아이디 찾기
	public int findId(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("find_email");
		
		// 받은 이메일이 비어있거나 null일 경우
		if(email.isEmpty() || email == null) {
			
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			
			return statusCode;
		}
		
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		
		MemberDAO dao = new MemberDAO();
		String db_id = dao.checkMemberByEmail(member);
		
		if(db_id.isEmpty() || db_id == null) {
			// 찾아온 아이디가 없을 때
			statusCode = HttpServletResponse.SC_NOT_FOUND;
			
			//db_id = "가입된 아이디가 없습니다.";
			
		} else {
			statusCode = HttpServletResponse.SC_OK;
				
		}
		
		try {
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			
			out.print("location.href=\"http://localhost/ridibooks.com/account/findIdView.jsp?id="+db_id+"\"");
			
			out.print("</script>");
			
			out.close();
		} catch (IOException e) {
			// e.printStackTrace();
			System.out.println("언제뜨는 에러인지 확인 중");
		}
		
			
		return statusCode;
	}
	
	// 비밀번호 찾기
	public int findPw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("find_id");
		String email = request.getParameter("find_email");
		String newPw = "";
		
		// 전달 받은 값이 공백이거나 null일 경우
		if( (id.isEmpty() || id == null) || (email.isEmpty() || email == null) ) {
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			
			return statusCode;
		}
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setEmail(email);
		
		MemberDAO dao = new MemberDAO();
		String db_id = dao.checkMemberByEmail(member);
		
		if(db_id.equals(member.getId())) {
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
			
			dao = new MemberDAO();
			boolean update = dao.updatePw(member);
			
			if(update) {
				// 새로운 비밀번호 db에 저장완료
				statusCode = HttpServletResponse.SC_OK;
			}
		} else {
			// 비밀번호를 찾기위해 입력한 id 또는 email이 틀렸을 때
			statusCode = HttpServletResponse.SC_NOT_FOUND;
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("pw", newPw);
		
		try {
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			
			out.print("location.href=\"http://localhost/ridibooks.com/account/findPwView.jsp?\"");
			
			out.print("</script>");
			
			out.close();
		} catch (IOException e) {
			// e.printStackTrace();
			System.out.println("언제뜨는 에러인지 확인 중");
		}
		
		return statusCode;
	}
	
	// 아이디 중복 확인
	public int checkId (HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("sign_id");
		
		if( (id.isEmpty() || id == null) ) {
			
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			
			return statusCode;
		}
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		
		MemberDAO dao = new MemberDAO();
		boolean checkId = dao.checkId(member);
		
		if(checkId) {
			statusCode = HttpServletResponse.SC_NOT_FOUND;
		} else {
			statusCode = HttpServletResponse.SC_OK;
		}
		
		return statusCode;
	}
	
	// 이메일 중복 확인
		public int checkEmail (HttpServletRequest request, HttpServletResponse response) {
			
			String email = request.getParameter("sign_email");
			
			if( (email.isEmpty() || email == null) ) {
				
				statusCode = HttpServletResponse.SC_BAD_REQUEST;
				
				return statusCode;
			}
			
			MemberDTO member = new MemberDTO();
			member.setEmail(email);
			
			MemberDAO dao = new MemberDAO();
			
			boolean checkEmail = dao.checkEmail(member);
			
			if(checkEmail) {
				statusCode = HttpServletResponse.SC_NOT_FOUND;
			} else {
				statusCode = HttpServletResponse.SC_OK;
			}
			
			return statusCode;
		}

}
