package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class CouponHistoryDTO {
	
	private int historyNo;
	private int couponNo;
	private Date useDate;
	private int paymentNo;
	
	public CouponHistoryDTO() {
		super();
	}

	public CouponHistoryDTO(int historyNo, int couponNo, Date useDate, int paymentNo) {
		super();
		this.historyNo = historyNo;
		this.couponNo = couponNo;
		this.useDate = useDate;
		this.paymentNo = paymentNo;
	}

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	@Override
	public String toString() {
		return "CouponHistoryDTO [historyNo=" + historyNo + ", couponNo=" + couponNo + ", useDate=" + useDate
				+ ", paymentNo=" + paymentNo + "]";
	}
	
	
	 
	
}
