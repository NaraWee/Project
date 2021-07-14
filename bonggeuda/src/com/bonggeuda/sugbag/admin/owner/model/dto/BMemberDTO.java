package com.bonggeuda.sugbag.admin.owner.model.dto;

import java.sql.Date;

public class BMemberDTO {

	private int rowNum;
	private int bListNo;
	private int memberNo;
	private String bReason;
	private String memberType;
	private Date enrollDate;
	
	public BMemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public BMemberDTO(int rowNum, int bListNo, int memberNo, String bReason, String memberType, Date enrollDate) {
		super();
		this.rowNum = rowNum;
		this.bListNo = bListNo;
		this.memberNo = memberNo;
		this.bReason = bReason;
		this.memberType = memberType;
		this.enrollDate = enrollDate;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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

	public String getbReason() {
		return bReason;
	}

	public void setbReason(String bReason) {
		this.bReason = bReason;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "BMemberDTO [rowNum=" + rowNum + ", bListNo=" + bListNo + ", memberNo=" + memberNo + ", bReason="
				+ bReason + ", memberType=" + memberType + ", enrollDate=" + enrollDate + "]";
	}


	
	
	
}
