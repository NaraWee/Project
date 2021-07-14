package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class AdoptReplyDTO {
	
	private int replyCode;
	private String replyContent;
	private Date replyDate;
	private String replyDeleteYN;
	private String reportYN;
	private String userNickname;
	private int replyUserCode;
	private int boardUserCode;
	private int boardCode;
	private String replyReportTitle;
	private String replyReportContent;
	private Date replyReportDate;
	private int decisionCode;
	
	public AdoptReplyDTO() {}

	public AdoptReplyDTO(int replyCode, String replyContent, Date replyDate, String replyDeleteYN, String reportYN,
			String userNickname, int replyUserCode, int boardUserCode, int boardCode, String replyReportTitle,
			String replyReportContent, Date replyReportDate, int decisionCode) {
		super();
		this.replyCode = replyCode;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyDeleteYN = replyDeleteYN;
		this.reportYN = reportYN;
		this.userNickname = userNickname;
		this.replyUserCode = replyUserCode;
		this.boardUserCode = boardUserCode;
		this.boardCode = boardCode;
		this.replyReportTitle = replyReportTitle;
		this.replyReportContent = replyReportContent;
		this.replyReportDate = replyReportDate;
		this.decisionCode = decisionCode;
	}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
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

	public String getReplyDeleteYN() {
		return replyDeleteYN;
	}

	public void setReplyDeleteYN(String replyDeleteYN) {
		this.replyDeleteYN = replyDeleteYN;
	}

	public String getReportYN() {
		return reportYN;
	}

	public void setReportYN(String reportYN) {
		this.reportYN = reportYN;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public int getReplyUserCode() {
		return replyUserCode;
	}

	public void setReplyUserCode(int replyUserCode) {
		this.replyUserCode = replyUserCode;
	}

	public int getBoardUserCode() {
		return boardUserCode;
	}

	public void setBoardUserCode(int boardUserCode) {
		this.boardUserCode = boardUserCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getReplyReportTitle() {
		return replyReportTitle;
	}

	public void setReplyReportTitle(String replyReportTitle) {
		this.replyReportTitle = replyReportTitle;
	}

	public String getReplyReportContent() {
		return replyReportContent;
	}

	public void setReplyReportContent(String replyReportContent) {
		this.replyReportContent = replyReportContent;
	}

	public Date getReplyReportDate() {
		return replyReportDate;
	}

	public void setReplyReportDate(Date replyReportDate) {
		this.replyReportDate = replyReportDate;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	@Override
	public String toString() {
		return "AdoptReplyDTO [replyCode=" + replyCode + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", replyDeleteYN=" + replyDeleteYN + ", reportYN=" + reportYN + ", userNickname=" + userNickname
				+ ", replyUserCode=" + replyUserCode + ", boardUserCode=" + boardUserCode + ", boardCode=" + boardCode
				+ ", replyReportTitle=" + replyReportTitle + ", replyReportContent=" + replyReportContent
				+ ", replyReportDate=" + replyReportDate + ", decisionCode=" + decisionCode + "]";
	}

	

}
