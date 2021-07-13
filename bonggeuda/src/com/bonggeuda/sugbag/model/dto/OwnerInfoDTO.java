package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class OwnerInfoDTO {
	
	private int ownerNo;
	private String ownerID;
	private String ownerPwd;
	private String ownerPhone;
	private String ownerWithdrawYn;
	private java.sql.Date ownerSignDate;
	private java.sql.Date ownerWithDate;
	
	public OwnerInfoDTO() { }

	public OwnerInfoDTO(int ownerNo, String ownerID, String ownerPwd, String ownerPhone, String ownerWithdrawYn,
			Date ownerSignDate, Date ownerWithDate) {
		super();
		this.ownerNo = ownerNo;
		this.ownerID = ownerID;
		this.ownerPwd = ownerPwd;
		this.ownerPhone = ownerPhone;
		this.ownerWithdrawYn = ownerWithdrawYn;
		this.ownerSignDate = ownerSignDate;
		this.ownerWithDate = ownerWithDate;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(String ownerID) {
		this.ownerID = ownerID;
	}

	public String getOwnerPwd() {
		return ownerPwd;
	}

	public void setOwnerPwd(String ownerPwd) {
		this.ownerPwd = ownerPwd;
	}

	public String getOwnerPhone() {
		return ownerPhone;
	}

	public void setOwnerPhone(String ownerPhone) {
		this.ownerPhone = ownerPhone;
	}

	public String getOwnerWithdrawYn() {
		return ownerWithdrawYn;
	}

	public void setOwnerWithdrawYn(String ownerWithdrawYn) {
		this.ownerWithdrawYn = ownerWithdrawYn;
	}

	public java.sql.Date getOwnerSignDate() {
		return ownerSignDate;
	}

	public void setOwnerSignDate(java.sql.Date ownerSignDate) {
		this.ownerSignDate = ownerSignDate;
	}

	public java.sql.Date getOwnerWithDate() {
		return ownerWithDate;
	}

	public void setOwnerWithDate(java.sql.Date ownerWithDate) {
		this.ownerWithDate = ownerWithDate;
	}

	@Override
	public String toString() {
		return "OwnerInfoDTO [ownerNo=" + ownerNo + ", ownerID=" + ownerID + ", ownerPwd=" + ownerPwd + ", ownerPhone="
				+ ownerPhone + ", ownerWithdrawYn=" + ownerWithdrawYn + ", ownerSignDate=" + ownerSignDate
				+ ", ownerWithDate=" + ownerWithDate + "]";
	}
	
	
	
	
	
	
	

}
