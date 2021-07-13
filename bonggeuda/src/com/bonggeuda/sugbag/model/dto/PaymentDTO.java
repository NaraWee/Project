package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class PaymentDTO {
    
	private int paymentNo;
	private String method; 
	private int amount; 
	private Date paymentTime; 
	private int bookNo;
	private String couponYN; 
	private String pointYN; 
	private int discount;

	public PaymentDTO() {
		super();
	}

	public PaymentDTO(int paymentNo, String method, int amount, Date paymentTime, int bookNo, String couponYN,
			String pointYN, int discount) {
		super();
		this.paymentNo = paymentNo;
		this.method = method;
		this.amount = amount;
		this.paymentTime = paymentTime;
		this.bookNo = bookNo;
		this.couponYN = couponYN;
		this.pointYN = pointYN;
		this.discount = discount;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Date pamentTime) {
		this.paymentTime = pamentTime;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getCouponYN() {
		return couponYN;
	}

	public void setCouponYN(String couponYN) {
		this.couponYN = couponYN;
	}

	public String getPointYN() {
		return pointYN;
	}

	public void setPointYN(String pointYN) {
		this.pointYN = pointYN;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "PaymentDTO [paymentNo=" + paymentNo + ", method=" + method + ", amount=" + amount + ", paymentTime="
				+ paymentTime + ", bookNo=" + bookNo + ", couponYN=" + couponYN + ", pointYN=" + pointYN + ", discount="
				+ discount + "]";
	}
	
	
	
	
}
