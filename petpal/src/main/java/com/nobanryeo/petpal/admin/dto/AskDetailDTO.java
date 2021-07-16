package com.nobanryeo.petpal.admin.dto;

import java.util.Date;

public class AskDetailDTO {
	private int boardCode;
	private String userId;
	private String userName;
	private String boardTitle;
	private java.util.Date postDate;
	private String boardContent;
	private String replyContent;
	
	public AskDetailDTO() {
		
	}
	
	//public AskDetailDTO() {
		
	//}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public java.util.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public AskDetailDTO(int boardCode, String userId, String userName, String boardTitle, Date postDate,
			String boardContent, String replyContent) {
		super();
		this.boardCode = boardCode;
		this.userId = userId;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.postDate = postDate;
		this.boardContent = boardContent;
		this.replyContent = replyContent;
	}

	@Override
	public String toString() {
		return "AskDetailDTO [boardCode=" + boardCode + ", userId=" + userId + ", userName=" + userName
				+ ", boardTitle=" + boardTitle + ", postDate=" + postDate + ", boardContent=" + boardContent
				+ ", replyContent=" + replyContent + "]";
	}

	
	
	
	
}
