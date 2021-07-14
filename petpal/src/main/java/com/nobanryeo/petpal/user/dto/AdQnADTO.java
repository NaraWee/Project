package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class AdQnADTO {

	private int boardCode;
	private String boardTitle;
	private String boardContent;
	private int questionType;
	private Date boardPostDate;
	private String adminReplyContent;
	private int stateCode;
	private int userCode;
	
	public AdQnADTO() {}

	public AdQnADTO(int boardCode, String boardTitle, String boardContent, int questionType, Date boardPostDate,
			String adminReplyContent, int stateCode, int userCode) {
		super();
		this.boardCode = boardCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.questionType = questionType;
		this.boardPostDate = boardPostDate;
		this.adminReplyContent = adminReplyContent;
		this.stateCode = stateCode;
		this.userCode = userCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
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

	public int getQuestionType() {
		return questionType;
	}

	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}

	public Date getBoardPostDate() {
		return boardPostDate;
	}

	public void setBoardPostDate(Date boardPostDate) {
		this.boardPostDate = boardPostDate;
	}

	public String getAdminReplyContent() {
		return adminReplyContent;
	}

	public void setAdminReplyContent(String adminReplyContent) {
		this.adminReplyContent = adminReplyContent;
	}

	public int getStateCode() {
		return stateCode;
	}

	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "AdQnADTO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", questionType=" + questionType + ", boardPostDate=" + boardPostDate + ", adminReplyContent="
				+ adminReplyContent + ", stateCode=" + stateCode + ", userCode=" + userCode + "]";
	}
	
}
