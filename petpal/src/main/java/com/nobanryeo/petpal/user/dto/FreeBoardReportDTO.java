package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class FreeBoardReportDTO {

	private int reportCode;
	private String reportTitle;
	private String reportContent;
	private Date reportDate;
	private int decisionCode;
	private int userCode;
	private int boardCode;
	
	public FreeBoardReportDTO() {}

	public FreeBoardReportDTO(int reportCode, String reportTitle, String reportContent, Date reportDate,
			int decisionCode, int userCode, int boardCode) {
		super();
		this.reportCode = reportCode;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.decisionCode = decisionCode;
		this.userCode = userCode;
		this.boardCode = boardCode;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	@Override
	public String toString() {
		return "FreeboardReportDTO [reportCode=" + reportCode + ", reportTitle=" + reportTitle + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", decisionCode=" + decisionCode + ", userCode="
				+ userCode + ", boardCode=" + boardCode + "]";
	}
}
