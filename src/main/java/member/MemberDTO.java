package member;

import java.time.LocalDateTime;

//회원 정보
public class MemberDTO {
	private String id;					// 아이디
	private String pw;					// 비밀번호
	private String email;				// 이메일
	private String name;				// 이름
	private String year;				// 출생년도(4자리)
	private String gender;				// 성별 (남,여)
	private char marketing_agree;		// 마케팅 수신여부(Y,N)
	private char select_agree;		// 개인정보제공 동의여부(Y,N)
	private LocalDateTime signup_date;	// 회원가입 날짜
	private LocalDateTime login_date;	// 마지막 로그인 날짜
	private int cash;					// 보유 캐쉬
	private int point;					// 보유 포인트
	private int status;				// 회원상태(1-정상 / 2-탈퇴)
	private String pwChk;				// 비밀번호 확인

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public char getMarketing_agree() {
		return marketing_agree;
	}

	public void setMarketing_agree(char marketing_agree) {
		this.marketing_agree = marketing_agree;
	}

	public char getSelect_agree() {
		return select_agree;
	}

	public void setSelect_agree(char select_agree) {
		this.select_agree = select_agree;
	}

	public LocalDateTime getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(LocalDateTime signup_date) {
		this.signup_date = signup_date;
	}

	public LocalDateTime getLogin_date() {
		return login_date;
	}

	public void setLogin_date(LocalDateTime login_date) {
		this.login_date = login_date;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPwChk() {
		return pwChk;
	}

	public void setPwChk(String pwChk) {
		this.pwChk = pwChk;
	}
}
