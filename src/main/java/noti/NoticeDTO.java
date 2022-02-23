package noti;

import java.time.LocalDateTime;

public class NoticeDTO {
	
	private int noti_no;				// 알림 고유 식별 번호
	private String noti_title;			// 알림 제목
	private String noti_text;			// 알림 내용
	private LocalDateTime noti_date;	// 알림 추가 날짜
	private int noti_status;			// 알림 상태 (0->신규 / 1->읽음
	private long duration;				// 알림 받은지 몇시간 지났는지
	
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_text() {
		return noti_text;
	}
	public void setNoti_text(String noti_text) {
		this.noti_text = noti_text;
	}
	public LocalDateTime getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(LocalDateTime noti_date) {
		this.noti_date = noti_date;
	}
	public int getNoti_status() {
		return noti_status;
	}
	public void setNoti_status(int noti_status) {
		this.noti_status = noti_status;
	}
	public long getDuration() {
		return duration;
	}
	public void setDuration(long duration) {
		this.duration = duration;
	}
	
}
