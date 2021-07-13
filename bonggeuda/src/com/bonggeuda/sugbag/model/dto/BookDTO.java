package com.bonggeuda.sugbag.model.dto;

public class BookDTO {

	private int bookNo;
	private String bookUserName;
	private int bookPersonnel;
	private String bookCheckDate; // 체크인날짜
	private String bookCheckoutDate;
	private String bookApproveYn;
	private String bookCheckIn; // 체크인시간
	private String request; // 요청사항
	private int roomNo;
	private int userNo;
	private int ownerNo;
	private String bookStatusYNC;
	private String roomName;
	private String accomoName;
	private long day; // bookCheckoutDate - bookCheckDate
	private String bookImg;
	private String userPhone; // userPhone 추가
	private int rowNum;
	private int accomoNo;

	public BookDTO() {
	}

	public BookDTO(int bookNo, String bookUserName, int bookPersonnel, String bookCheckDate, String bookCheckoutDate,
			String bookApproveYn, String bookCheckIn, String request, int roomNo, int userNo, int ownerNo,
			String bookStatusYNC, String roomName, String accomoName, long day, String bookImg, String userPhone,
			int rowNum, int accomoNo) {
		super();
		this.bookNo = bookNo;
		this.bookUserName = bookUserName;
		this.bookPersonnel = bookPersonnel;
		this.bookCheckDate = bookCheckDate;
		this.bookCheckoutDate = bookCheckoutDate;
		this.bookApproveYn = bookApproveYn;
		this.bookCheckIn = bookCheckIn;
		this.request = request;
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.ownerNo = ownerNo;
		this.bookStatusYNC = bookStatusYNC;
		this.roomName = roomName;
		this.accomoName = accomoName;
		this.day = day;
		this.bookImg = bookImg;
		this.userPhone = userPhone;
		this.rowNum = rowNum;
		this.accomoNo = accomoNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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

	public String getBookCheckDate() {
		return bookCheckDate;
	}

	public void setBookCheckDate(String bookCheckDate) {
		this.bookCheckDate = bookCheckDate;
	}

	public String getBookCheckoutDate() {
		return bookCheckoutDate;
	}

	public void setBookCheckoutDate(String bookCheckoutDate) {
		this.bookCheckoutDate = bookCheckoutDate;
	}

	public String getBookApproveYn() {
		return bookApproveYn;
	}

	public void setBookApproveYn(String bookApproveYn) {
		this.bookApproveYn = bookApproveYn;
	}

	public String getBookCheckIn() {
		return bookCheckIn;
	}

	public void setBookCheckIn(String bookCheckIn) {
		this.bookCheckIn = bookCheckIn;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
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

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
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

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	@Override
	public String toString() {
		return "BookDTO [bookNo=" + bookNo + ", bookUserName=" + bookUserName + ", bookPersonnel=" + bookPersonnel
				+ ", bookCheckDate=" + bookCheckDate + ", bookCheckoutDate=" + bookCheckoutDate + ", bookApproveYn="
				+ bookApproveYn + ", bookCheckIn=" + bookCheckIn + ", request=" + request + ", roomNo=" + roomNo
				+ ", userNo=" + userNo + ", ownerNo=" + ownerNo + ", bookStatusYNC=" + bookStatusYNC + ", roomName="
				+ roomName + ", accomoName=" + accomoName + ", day=" + day + ", bookImg=" + bookImg + ", userPhone="
				+ userPhone + ", rowNum=" + rowNum + ", accomoNo=" + accomoNo + "]";
	}


}
