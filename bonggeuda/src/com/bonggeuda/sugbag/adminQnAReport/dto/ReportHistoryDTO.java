package com.bonggeuda.sugbag.adminQnAReport.dto;

import java.sql.Date;

public class ReportHistoryDTO {
	
	private int reportNo;
	private java.sql.Date answerDate;
	private String status;
	private String content;
	
	public ReportHistoryDTO() {
		
	}

	public ReportHistoryDTO(int reportNo, Date answerDate, String status, String content) {
		super();
		this.reportNo = reportNo;
		this.answerDate = answerDate;
		this.status = status;
		this.content = content;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public java.sql.Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(java.sql.Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ReportHistoryDTO [reportNo=" + reportNo + ", answerDate=" + answerDate + ", status=" + status
				+ ", content=" + content + "]";
	}

	
	

}
