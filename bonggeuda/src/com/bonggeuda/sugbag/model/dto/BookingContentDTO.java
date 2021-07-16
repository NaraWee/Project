package com.bonggeuda.sugbag.model.dto;

public class BookingContentDTO {
	
	private String bookCheckDate;	// 체크인날짜
	private String bookApproveYn;
	private int roomNo;
	private int userNo;
	private int ownerNo;
	private String bookStatusYNC;
	private long day;				// bookCheckoutDate - bookCheckDate
	private String bookImg;
	
	
	private String bookUserName;
	private int bookPersonnel;
	private String accomoName;
	private String roomName;
	private int bookNo;
	private String bookRequestDate; // 예약 일시
	private String bookCheckIn;		// 체크인시간
	private String bookCheckoutDate;
	private String request;			// 요청사항
	private String userPhone;
	private String email;
	private int paymentFee;
	private String paymentMethod;
	
	private int accomoNo;
	private int paymentNo;
	
	public BookingContentDTO() { }

	public BookingContentDTO(String bookCheckDate, String bookApproveYn, int roomNo, int userNo, int ownerNo,
			String bookStatusYNC, long day, String bookImg, String bookUserName, int bookPersonnel, String accomoName,
			String roomName, int bookNo, String bookRequestDate, String bookCheckIn, String bookCheckoutDate,
			String request, String userPhone, String email, int paymentFee, String paymentMethod, int accomoNo,
			int paymentNo) {
		super();
		this.bookCheckDate = bookCheckDate;
		this.bookApproveYn = bookApproveYn;
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.ownerNo = ownerNo;
		this.bookStatusYNC = bookStatusYNC;
		this.day = day;
		this.bookImg = bookImg;
		this.bookUserName = bookUserName;
		this.bookPersonnel = bookPersonnel;
		this.accomoName = accomoName;
		this.roomName = roomName;
		this.bookNo = bookNo;
		this.bookRequestDate = bookRequestDate;
		this.bookCheckIn = bookCheckIn;
		this.bookCheckoutDate = bookCheckoutDate;
		this.request = request;
		this.userPhone = userPhone;
		this.email = email;
		this.paymentFee = paymentFee;
		this.paymentMethod = paymentMethod;
		this.accomoNo = accomoNo;
		this.paymentNo = paymentNo;
	}

	public String getBookCheckDate() {
		return bookCheckDate;
	}

	public void setBookCheckDate(String bookCheckDate) {
		this.bookCheckDate = bookCheckDate;
	}

	public String getBookApproveYn() {
		return bookApproveYn;
	}

	public void setBookApproveYn(String bookApproveYn) {
		this.bookApproveYn = bookApproveYn;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getBookStatusYNC() {
		return bookStatusYNC;
	}

	public void setBookStatusYNC(String bookStatusYNC) {
		this.bookStatusYNC = bookStatusYNC;
	}

	public long getDay() {
		return day;
	}

	public void setDay(long day) {
		this.day = day;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	public String getBookUserName() {
		return bookUserName;
	}

	public void setBookUserName(String bookUserName) {
		this.bookUserName = bookUserName;
	}

	public int getBookPersonnel() {
		return bookPersonnel;
	}

	public void setBookPersonnel(int bookPersonnel) {
		this.bookPersonnel = bookPersonnel;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getBookRequestDate() {
		return bookRequestDate;
	}

	public void setBookRequestDate(String bookRequestDate) {
		this.bookRequestDate = bookRequestDate;
	}

	public String getBookCheckIn() {
		return bookCheckIn;
	}

	public void setBookCheckIn(String bookCheckIn) {
		this.bookCheckIn = bookCheckIn;
	}

	public String getBookCheckoutDate() {
		return bookCheckoutDate;
	}

	public void setBookCheckoutDate(String bookCheckoutDate) {
		this.bookCheckoutDate = bookCheckoutDate;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPaymentFee() {
		return paymentFee;
	}

	public void setPaymentFee(int paymentFee) {
		this.paymentFee = paymentFee;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	@Override
	public String toString() {
		return "BookingContentDTO [bookCheckDate=" + bookCheckDate + ", bookApproveYn=" + bookApproveYn + ", roomNo="
				+ roomNo + ", userNo=" + userNo + ", ownerNo=" + ownerNo + ", bookStatusYNC=" + bookStatusYNC + ", day="
				+ day + ", bookImg=" + bookImg + ", bookUserName=" + bookUserName + ", bookPersonnel=" + bookPersonnel
				+ ", accomoName=" + accomoName + ", roomName=" + roomName + ", bookNo=" + bookNo + ", bookRequestDate="
				+ bookRequestDate + ", bookCheckIn=" + bookCheckIn + ", bookCheckoutDate=" + bookCheckoutDate
				+ ", request=" + request + ", userPhone=" + userPhone + ", email=" + email + ", paymentFee="
				+ paymentFee + ", paymentMethod=" + paymentMethod + ", accomoNo=" + accomoNo + ", paymentNo="
				+ paymentNo + "]";
	}

	
	

	
}
