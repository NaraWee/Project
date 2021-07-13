package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class CouponDTO {

	private int couponNo;
	private Date couponStart;
	private Date couponEnd;
	private String couponCondition;
	private String couponUseYN;
	private int userNo;
	private String couponName;
	private int couponDiscount;
	
	public CouponDTO() {}

	public CouponDTO(int couponNo, Date couponStart, Date couponEnd, String couponCondition, String couponUseYN,
			int userNo, String couponName, int couponDiscount) {
		super();
		this.couponNo = couponNo;
		this.couponStart = couponStart;
		this.couponEnd = couponEnd;
		this.couponCondition = couponCondition;
		this.couponUseYN = couponUseYN;
		this.userNo = userNo;
		this.couponName = couponName;
		this.couponDiscount = couponDiscount;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public Date getCouponStart() {
		return couponStart;
	}

	public void setCouponStart(Date couponStart) {
		this.couponStart = couponStart;
	}

	public Date getCouponEnd() {
		return couponEnd;
	}

	public void setCouponEnd(Date couponEnd) {
		this.couponEnd = couponEnd;
	}

	public String getCouponCondition() {
		return couponCondition;
	}

	public void setCouponCondition(String couponCondition) {
		this.couponCondition = couponCondition;
	}

	public String getCouponUseYN() {
		return couponUseYN;
	}

	public void setCouponUseYN(String couponUseYN) {
		this.couponUseYN = couponUseYN;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getCouponDiscount() {
		return couponDiscount;
	}

	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}

	@Override
	public String toString() {
		return "CouponDTO [couponNo=" + couponNo + ", couponStart=" + couponStart + ", couponEnd=" + couponEnd
				+ ", couponCondition=" + couponCondition + ", couponUseYN=" + couponUseYN + ", userNo=" + userNo
				+ ", couponName=" + couponName + ", couponDiscount=" + couponDiscount + "]";
	}
	
}
