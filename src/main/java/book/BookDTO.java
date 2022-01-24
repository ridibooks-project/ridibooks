package book;

// 도서 정보
public class BookDTO {
	
	private int book_no;		// 도서 식별 번호
	private String bookName;	// 도서 명
	private int au_no;			// 저자 식별 번호
	private int tr_no;			// 역자 식별 번호
	private int buyPrice;		// 구매 가격
	private int rentPrice;		// 대여 가격
	private String introduce;	// 작품소개
	private int grade_no;		// 평점 번호(리뷰)
	
	
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getAu_no() {
		return au_no;
	}
	public void setAu_no(int au_no) {
		this.au_no = au_no;
	}
	public int getTr_no() {
		return tr_no;
	}
	public void setTr_no(int tr_no) {
		this.tr_no = tr_no;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getGrade_no() {
		return grade_no;
	}
	public void setGrade_no(int grade_no) {
		this.grade_no = grade_no;
	}
}
