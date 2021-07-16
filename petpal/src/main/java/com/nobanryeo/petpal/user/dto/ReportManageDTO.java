package com.nobanryeo.petpal.user.dto;

import java.sql.Date;


import com.fasterxml.jackson.annotation.JsonFormat;

public class ReportManageDTO {
	
	private int reportCode; //신고관리코드
	private String title; //신고타이틀
	private String content; //신고내용
	private java.sql.Date date;		//신고날짜
	private int decisionCode; //심사코드
	private int userCode; //신고자코드
	private int stateCode; //상태코드
	private String dReason; //심사사유
	private String dDate; //심사날짜
	private String replyTitle; //댓글신고타이틀
	private String replyContent; //댓글신고내용
	private Date replyDate; //댓글신고날짜
	
	
	public ReportManageDTO() {
		
	}


	public ReportManageDTO(int reportCode, String title, String content, Date date, int decisionCode, int userCode,
			int stateCode, String dReason, String dDate, String replyTitle, String replyContent, Date replyDate) {
		super();
		this.reportCode = reportCode;
		this.title = title;
		this.content = content;
		this.date = date;
		this.decisionCode = decisionCode;
		this.userCode = userCode;
		this.stateCode = stateCode;
		this.dReason = dReason;
		this.dDate = dDate;
		this.replyTitle = replyTitle;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}


	public int getReportCode() {
		return reportCode;
	}


	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public java.sql.Date getDate() {
		return date;
	}


	public void setDate(java.sql.Date date) {
		this.date = date;
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


	public int getStateCode() {
		return stateCode;
	}


	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}


	public String getdReason() {
		return dReason;
	}


	public void setdReason(String dReason) {
		this.dReason = dReason;
	}


	public String getdDate() {
		return dDate;
	}


	public void setdDate(String dDate) {
		this.dDate = dDate;
	}


	public String getReplyTitle() {
		return replyTitle;
	}


	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Date getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	@Override
	public String toString() {
		return "ReportManageDTO [reportCode=" + reportCode + ", title=" + title + ", content=" + content + ", date="
				+ date + ", decisionCode=" + decisionCode + ", userCode=" + userCode + ", stateCode=" + stateCode
				+ ", dReason=" + dReason + ", dDate=" + dDate + ", replyTitle=" + replyTitle + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + "]";
	}


	
	
	
	
	
	
}
