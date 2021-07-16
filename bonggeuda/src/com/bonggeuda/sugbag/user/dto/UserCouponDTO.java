package com.bonggeuda.sugbag.user.dto;

import java.sql.Date;

public class UserCouponDTO {

	private String couponName;
	private java.sql.Date startDate;
	private java.sql.Date endDate;
	private int condition;
	private int discount;
	
	public UserCouponDTO() {}

	public UserCouponDTO(String couponName, Date startDate, Date endDate, int condition, int discount) {
		super();
		this.couponName = couponName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.condition = condition;
		this.discount = discount;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public java.sql.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "UserCouponDTO [couponName=" + couponName + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", condition=" + condition + ", discount=" + discount + "]";
	}

	

	
	
	
}