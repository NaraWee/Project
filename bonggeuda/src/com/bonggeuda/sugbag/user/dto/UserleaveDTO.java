package com.bonggeuda.sugbag.user.dto;

import java.io.Serializable;
import java.sql.Date;

public class UserleaveDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6310412939527384691L;
	
	private int rnum;
	private int leaveNo; // 탈퇴번호
	private String email; // 아이디
	private String reason; // 탈퇴이유
	private java.sql.Date leaveDate; // 탈퇴날짜
	private java.sql.Date year; // 탈퇴날짜
	
	public UserleaveDTO() {}

	public UserleaveDTO(int rnum, int leaveNo, String email, String reason, Date leaveDate, Date year) {
		super();
		this.rnum = rnum;
		this.leaveNo = leaveNo;
		this.email = email;
		this.reason = reason;
		this.leaveDate = leaveDate;
		this.year = year;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getLeaveNo() {
		return leaveNo;
	}

	public void setLeaveNo(int leaveNo) {
		this.leaveNo = leaveNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public java.sql.Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(java.sql.Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public java.sql.Date getYear() {
		return year;
	}

	public void setYear(java.sql.Date year) {
		this.year = year;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserleaveDTO [rnum=" + rnum + ", leaveNo=" + leaveNo + ", email=" + email + ", reason=" + reason
				+ ", leaveDate=" + leaveDate + ", year=" + year + "]";
	}



	

	
	
}
