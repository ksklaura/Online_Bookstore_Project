package mypage;

public class userMypageVo {
	String orderNumber;		 // 주문번호
	String uId;				 // 구매자 아이디
	String receiver; 		 // 수령인 이름
	int bookCode; 			 // 구매한 도서코드
	String bookTitle; 		 // 구매한 도서명			// DB에 추가해야 할듯
	int price; 				 // 도서 판매가			// DB에 추가해야 할듯
	int ea; 				 // 수량
	int amt;				 // 총 금액				// DB에 추가해야 할듯
	String bookImage; 		 // 도서 이미지			// DB에 추가?
	String orderDate; 		 // 구매일자
	String paymentType; 	 // 결제 방식
	String zipCode; 		 // 배송지 우편번호
	String address; 		 // 배송지 주소
	String phone; 			 // 전화번호
	// String shippingStatus;// 배송상황 				// DB에 추가?
	
	public userMypageVo() {}

	/* GETTERS & SETTERS */

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getBookCode() {
		return bookCode;
	}

	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}
	
	public int getAmt() {
		return amt;
	}

	public void setAmt(int amt) {
		this.amt = amt;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	/*
	 * public String getShippingStatus() { return shippingStatus; }
	 * 
	 * public void setShippingStatus(String shippingStatus) { this.shippingStatus =
	 * shippingStatus; }
	 */
}
