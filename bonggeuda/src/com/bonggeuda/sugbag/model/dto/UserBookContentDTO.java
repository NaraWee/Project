package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class UserBookContentDTO {

	private String bookCheckDate;
	private String checkoutDate;
	private String bookCheckIn;
	private String checkOut;
	private int bookNo;
	private String bookUserName;
	private String bookPhone;
	private int cancleAmount;
	private String thumbnailPath;
	private String accomoName;
	private String roomName;
	private int paymentAmount;
	private String paymentMethod;
	private int refundAmount;
	private int cancleFee;
	private String reasonCancle;
	private int paymentNo;
	private String bookApproveYN;
	private int accomoNo;
	private int roomNo;
	private Date paymentTime;
	
	public UserBookContentDTO() {}

	public UserBookContentDTO(String bookCheckDate, String checkoutDate, String bookCheckIn, String checkOut,
			int bookNo, String bookUserName, String bookPhone, int cancleAmount, String thumbnailPath,
			String accomoName, String roomName, int paymentAmount, String paymentMethod, int refundAmount,
			int cancleFee, String reasonCancle, int paymentNo, String bookApproveYN, int accomoNo, int roomNo,
			Date paymentTime) {
		super();
		this.bookCheckDate = bookCheckDate;
		this.checkoutDate = checkoutDate;
		this.bookCheckIn = bookCheckIn;
		this.checkOut = checkOut;
		this.bookNo = bookNo;
		this.bookUserName = bookUserName;
		this.bookPhone = bookPhone;
		this.cancleAmount = cancleAmount;
		this.thumbnailPath = thumbnailPath;
		this.accomoName = accomoName;
		this.roomName = roomName;
		this.paymentAmount = paymentAmount;
		this.paymentMethod = paymentMethod;
		this.refundAmount = refundAmount;
		this.cancleFee = cancleFee;
		this.reasonCancle = reasonCancle;
		this.paymentNo = paymentNo;
		this.bookApproveYN = bookApproveYN;
		this.accomoNo = accomoNo;
		this.roomNo = roomNo;
		this.paymentTime = paymentTime;
	}

	public String getBookCheckDate() {
		return bookCheckDate;
	}

	public void setBookCheckDate(String bookCheckDate) {
		this.bookCheckDate = bookCheckDate;
	}

	public String getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public String getBookCheckIn() {
		return bookCheckIn;
	}

	public void setBookCheckIn(String bookCheckIn) {
		this.bookCheckIn = bookCheckIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
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

	public String getBookPhone() {
		return bookPhone;
	}

	public void setBookPhone(String bookPhone) {
		this.bookPhone = bookPhone;
	}

	public int getCancleAmount() {
		return cancleAmount;
	}

	public void setCancleAmount(int cancleAmount) {
		this.cancleAmount = cancleAmount;
	}

	public String getThumbnailPath() {
		return thumbnailPath;
	}

	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
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

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getRefundAmount() {
		return refundAmount;
	}

	public void setRefundAmount(int refundAmount) {
		this.refundAmount = refundAmount;
	}

	public int getCancleFee() {
		return cancleFee;
	}

	public void setCancleFee(int cancleFee) {
		this.cancleFee = cancleFee;
	}

	public String getReasonCancle() {
		return reasonCancle;
	}

	public void setReasonCancle(String reasonCancle) {
		this.reasonCancle = reasonCancle;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getBookApproveYN() {
		return bookApproveYN;
	}

	public void setBookApproveYN(String bookApproveYN) {
		this.bookApproveYN = bookApproveYN;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public Date getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}

	@Override
	public String toString() {
		return "UserBookContentDTO [bookCheckDate=" + bookCheckDate + ", checkoutDate=" + checkoutDate
				+ ", bookCheckIn=" + bookCheckIn + ", checkOut=" + checkOut + ", bookNo=" + bookNo + ", bookUserName="
				+ bookUserName + ", bookPhone=" + bookPhone + ", cancleAmount=" + cancleAmount + ", thumbnailPath="
				+ thumbnailPath + ", accomoName=" + accomoName + ", roomName=" + roomName + ", paymentAmount="
				+ paymentAmount + ", paymentMethod=" + paymentMethod + ", refundAmount=" + refundAmount + ", cancleFee="
				+ cancleFee + ", reasonCancle=" + reasonCancle + ", paymentNo=" + paymentNo + ", bookApproveYN="
				+ bookApproveYN + ", accomoNo=" + accomoNo + ", roomNo=" + roomNo + ", paymentTime=" + paymentTime
				+ "]";
	}

}
