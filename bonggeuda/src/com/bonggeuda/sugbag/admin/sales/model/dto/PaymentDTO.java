package com.bonggeuda.sugbag.admin.sales.model.dto;

import java.sql.Date;

public class PaymentDTO {

	private int paymentNo;
	private String paymentMethod; //결제 수단
	private int paymentAmount;
	private Date paymentTime;
	private int bookNo; //예약번호
	private String couponYn;
	private String pointYn;
	private int discount;
	
	private int userNo;
	private String userName;
	
	private String roomName;
	private String accomoName;
	
	private int roomNo;
	private int accomoNo;
	
	private String phone;
	
	private String cancleReason;
	private String refundStatus;
	private int cancleNo;
	private Date cancleDate;
	private int refundPrice;

	
	public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}


	public PaymentDTO(int paymentNo, String paymentMethod, int paymentAmount, Date paymentTime, int bookNo,
			String couponYn, String pointYn, int discount, int userNo, String userName, String roomName,
			String accomoName, int roomNo, int accomoNo, String phone, String cancleReason, String refundStatus,
			int cancleNo, Date cancleDate, int refundPrice) {
		super();
		this.paymentNo = paymentNo;
		this.paymentMethod = paymentMethod;
		this.paymentAmount = paymentAmount;
		this.paymentTime = paymentTime;
		this.bookNo = bookNo;
		this.couponYn = couponYn;
		this.pointYn = pointYn;
		this.discount = discount;
		this.userNo = userNo;
		this.userName = userName;
		this.roomName = roomName;
		this.accomoName = accomoName;
		this.roomNo = roomNo;
		this.accomoNo = accomoNo;
		this.phone = phone;
		this.cancleReason = cancleReason;
		this.refundStatus = refundStatus;
		this.cancleNo = cancleNo;
		this.cancleDate = cancleDate;
		this.refundPrice = refundPrice;
	}


	public int getPaymentNo() {
		return paymentNo;
	}


	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}


	public String getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public int getPaymentAmount() {
		return paymentAmount;
	}


	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}


	public Date getPaymentTime() {
		return paymentTime;
	}


	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}


	public int getBookNo() {
		return bookNo;
	}


	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}


	public String getCouponYn() {
		return couponYn;
	}


	public void setCouponYn(String couponYn) {
		this.couponYn = couponYn;
	}


	public String getPointYn() {
		return pointYn;
	}


	public void setPointYn(String pointYn) {
		this.pointYn = pointYn;
	}


	public int getDiscount() {
		return discount;
	}


	public void setDiscount(int discount) {
		this.discount = discount;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
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


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public int getAccomoNo() {
		return accomoNo;
	}


	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getCancleReason() {
		return cancleReason;
	}


	public void setCancleReason(String cancleReason) {
		this.cancleReason = cancleReason;
	}


	public String getRefundStatus() {
		return refundStatus;
	}


	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}


	public int getCancleNo() {
		return cancleNo;
	}


	public void setCancleNo(int cancleNo) {
		this.cancleNo = cancleNo;
	}


	public Date getCancleDate() {
		return cancleDate;
	}


	public void setCancleDate(Date cancleDate) {
		this.cancleDate = cancleDate;
	}


	public int getRefundPrice() {
		return refundPrice;
	}


	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}


	@Override
	public String toString() {
		return "PaymentDTO [paymentNo=" + paymentNo + ", paymentMethod=" + paymentMethod + ", paymentAmount="
				+ paymentAmount + ", paymentTime=" + paymentTime + ", bookNo=" + bookNo + ", couponYn=" + couponYn
				+ ", pointYn=" + pointYn + ", discount=" + discount + ", userNo=" + userNo + ", userName=" + userName
				+ ", roomName=" + roomName + ", accomoName=" + accomoName + ", roomNo=" + roomNo + ", accomoNo="
				+ accomoNo + ", phone=" + phone + ", cancleReason=" + cancleReason + ", refundStatus=" + refundStatus
				+ ", cancleNo=" + cancleNo + ", cancleDate=" + cancleDate + ", refundPrice=" + refundPrice + "]";
	}



	
	
	
	
	
	
}
