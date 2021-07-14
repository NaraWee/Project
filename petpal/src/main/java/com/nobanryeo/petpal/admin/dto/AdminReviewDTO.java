package com.nobanryeo.petpal.admin.dto;

import java.util.Date;

public class AdminReviewDTO {
	private int boardCode;
	private int userCode;
	private String userId;
	private String userName;
	private String boardTitle;
	private String category;
	private java.util.Date postDate;
	private String state;
	
	public AdminReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public java.util.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public AdminReviewDTO(int boardCode, int userCode, String userId, String userName, String boardTitle,
			String category, Date postDate, String state) {
		super();
		this.boardCode = boardCode;
		this.userCode = userCode;
		this.userId = userId;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.category = category;
		this.postDate = postDate;
		this.state = state;
	}

	@Override
	public String toString() {
		return "AdminReviewDTO [boardCode=" + boardCode + ", userCode=" + userCode + ", userId=" + userId
				+ ", userName=" + userName + ", boardTitle=" + boardTitle + ", category=" + category + ", postDate="
				+ postDate + ", state=" + state + "]";
	}
	
	
	
	
}
