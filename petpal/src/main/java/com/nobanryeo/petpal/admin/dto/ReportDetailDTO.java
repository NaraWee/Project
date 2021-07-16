package com.nobanryeo.petpal.admin.dto;

import java.util.Date;

public class ReportDetailDTO {
	private int reportCode;
	private int boardCode;
	private String userId;
	private String userName;
	private String reportedId;
	private String reportedName;
	private String adminId;
	private String adminName;
	private String boardTitle;
	private String boardContent;
	private String reportedTitle;
	private String reportedContent;
	private java.util.Date reportDate;
	private String reason;
	private String state;
	
	public ReportDetailDTO() {
		
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	public String getReportedName() {
		return reportedName;
	}

	public void setReportedName(String reportedName) {
		this.reportedName = reportedName;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getReportedTitle() {
		return reportedTitle;
	}

	public void setReportedTitle(String reportedTitle) {
		this.reportedTitle = reportedTitle;
	}

	public String getReportedContent() {
		return reportedContent;
	}

	public void setReportedContent(String reportedContent) {
		this.reportedContent = reportedContent;
	}

	public java.util.Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(java.util.Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public ReportDetailDTO(int reportCode, int boardCode, String userId, String userName, String reportedId,
			String reportedName, String adminId, String adminName, String boardTitle, String boardContent,
			String reportedTitle, String reportedContent, Date reportDate, String reason, String state) {
		super();
		this.reportCode = reportCode;
		this.boardCode = boardCode;
		this.userId = userId;
		this.userName = userName;
		this.reportedId = reportedId;
		this.reportedName = reportedName;
		this.adminId = adminId;
		this.adminName = adminName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.reportedTitle = reportedTitle;
		this.reportedContent = reportedContent;
		this.reportDate = reportDate;
		this.reason = reason;
		this.state = state;
	}

	@Override
	public String toString() {
		return "ReportDetailDTO [reportCode=" + reportCode + ", boardCode=" + boardCode + ", userId=" + userId
				+ ", userName=" + userName + ", reportedId=" + reportedId + ", reportedName=" + reportedName
				+ ", adminId=" + adminId + ", adminName=" + adminName + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", reportedTitle=" + reportedTitle + ", reportedContent=" + reportedContent
				+ ", reportDate=" + reportDate + ", reason=" + reason + ", state=" + state + "]";
	}

	

	
	
	
	
	
	
}
