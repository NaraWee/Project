package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class FreeBoardReplyDTO {

	private int replyCode;
	private String replyContent;
	private Date replyDate;
	private String replyDeleteYN;
	private String reportYN;
	private int boardCode;
	private String userNickName;
	private int userCode;
	private int userCode1;
	private String replyReportTitle;
	private String replyReportContent;
	private Date replyReportDate;
	private int decisionCode;
	
	public FreeBoardReplyDTO() {}

	public FreeBoardReplyDTO(int replyCode, String replyContent, Date replyDate, String replyDeleteYN, String reportYN,
			int boardCode, String userNickName, int userCode, int userCode1, String replyReportTitle,
			String replyReportContent, Date replyReportDate, int decisionCode) {
		super();
		this.replyCode = replyCode;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyDeleteYN = replyDeleteYN;
		this.reportYN = reportYN;
		this.boardCode = boardCode;
		this.userNickName = userNickName;
		this.userCode = userCode;
		this.userCode1 = userCode1;
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

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getUserCode1() {
		return userCode1;
	}

	public void setUserCode1(int userCode1) {
		this.userCode1 = userCode1;
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
		return "FreeBoardReplyDTO [replyCode=" + replyCode + ", replyContent=" + replyContent + ", replyDate="
				+ replyDate + ", replyDeleteYN=" + replyDeleteYN + ", reportYN=" + reportYN + ", boardCode=" + boardCode
				+ ", userNickName=" + userNickName + ", userCode=" + userCode + ", userCode1=" + userCode1
				+ ", replyReportTitle=" + replyReportTitle + ", replyReportContent=" + replyReportContent
				+ ", replyReportDate=" + replyReportDate + ", decisionCode=" + decisionCode + "]";
	}

}
