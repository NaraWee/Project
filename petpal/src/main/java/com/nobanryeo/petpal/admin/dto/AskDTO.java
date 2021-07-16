package com.nobanryeo.petpal.admin.dto;

import java.util.Date;

public class AskDTO {
	private int boardCode;
	private String boardTitle;
	private String boardContent;
	private int questionType;
	private java.util.Date postDate;
	private String userId;
	private String state;
	
	
	public AskDTO() {
		
	}


	public AskDTO(int boardCode, String boardTitle, String boardContent, int questionType, Date postDate, String userId,
			String state) {
		super();
		this.boardCode = boardCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.questionType = questionType;
		this.postDate = postDate;
		this.userId = userId;
		this.state = state;
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


	public java.util.Date getPostDate() {
		return postDate;
	}


	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	@Override
	public String toString() {
		return "AskDTO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", questionType=" + questionType + ", postDate=" + postDate + ", userId=" + userId + ", state="
				+ state + "]";
	}



	
	
	
	
	
	
	
}
