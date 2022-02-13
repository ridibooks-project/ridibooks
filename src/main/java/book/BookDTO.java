package book;

// 도서 정보
public class BookDTO {
	private int book_no;				// 도서 식별 번호
	private String book_name;			// 도서 제목
	private int buyprice;				// 도서 구매 가격
	private int rentprice;				// 도서 대여 가격
	private String introduction;		// 도서 소개
	private String book_image;			// 도서 이미지
	private int category_no;			// 카테고리 식별 번호
	
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(int buyprice) {
		this.buyprice = buyprice;
	}
	public int getRentprice() {
		return rentprice;
	}
	public void setRentprice(int rentprice) {
		this.rentprice = rentprice;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
}
