package com.bonggeuda.sugbag.adminQnAReport.dto;

import java.sql.Date;

public class ReportDTO {
	
	private int rnum;
	private int reportNo;
	private String wirterType; //작성구분
	private String reason;
	private int memberNo;
	private java.sql.Date reportDate;
	private String title;
	private String status;
	private String reportType; //신공당한타입
	private int reportedNo; //신고당한회원번호
	private String userId;
	private String ownerId;
	private String thumnailPath;
	
	public ReportDTO() {

	}

	public ReportDTO(int rnum, int reportNo, String wirterType, String reason, int memberNo, Date reportDate,
			String title, String status, String reportType, int reportedNo, String userId, String ownerId,
			String thumnailPath) {
		super();
		this.rnum = rnum;
		this.reportNo = reportNo;
		this.wirterType = wirterType;
		this.reason = reason;
		this.memberNo = memberNo;
		this.reportDate = reportDate;
		this.title = title;
		this.status = status;
		this.reportType = reportType;
		this.reportedNo = reportedNo;
		this.userId = userId;
		this.ownerId = ownerId;
		this.thumnailPath = thumnailPath;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getWirterType() {
		return wirterType;
	}

	public void setWirterType(String wirterType) {
		this.wirterType = wirterType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public java.sql.Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(java.sql.Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public int getReportedNo() {
		return reportedNo;
	}

	public void setReportedNo(int reportedNo) {
		this.reportedNo = reportedNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	public String getThumnailPath() {
		return thumnailPath;
	}

	public void setThumnailPath(String thumnailPath) {
		this.thumnailPath = thumnailPath;
	}

	@Override
	public String toString() {
		return "ReportDTO [rnum=" + rnum + ", reportNo=" + reportNo + ", wirterType=" + wirterType + ", reason="
				+ reason + ", memberNo=" + memberNo + ", reportDate=" + reportDate + ", title=" + title + ", status="
				+ status + ", reportType=" + reportType + ", reportedNo=" + reportedNo + ", userId=" + userId
				+ ", ownerId=" + ownerId + ", thumnailPath=" + thumnailPath + "]";
	}

	
	

	
	

}
