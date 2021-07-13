package com.bonggeuda.sugbag.user.dto;

import java.sql.Date;

public class UserBlistDTO {

	private int rnum;
	private int bListNo;
	private int memberNo;
	private String reason;
	private String writerType;
	private java.sql.Date enrollDate;
	
	
	public UserBlistDTO() {
		
	}


	public UserBlistDTO(int rnum, int bListNo, int memberNo, String reason, String writerType, Date enrollDate) {
		super();
		this.rnum = rnum;
		this.bListNo = bListNo;
		this.memberNo = memberNo;
		this.reason = reason;
		this.writerType = writerType;
		this.enrollDate = enrollDate;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getbListNo() {
		return bListNo;
	}


	public void setbListNo(int bListNo) {
		this.bListNo = bListNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getWriterType() {
		return writerType;
	}


	public void setWriterType(String writerType) {
		this.writerType = writerType;
	}


	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	@Override
	public String toString() {
		return "UserBlistDTO [rnum=" + rnum + ", bListNo=" + bListNo + ", memberNo=" + memberNo + ", reason=" + reason
				+ ", writerType=" + writerType + ", enrollDate=" + enrollDate + "]";
	}

	

	
	
	
	
	
}
