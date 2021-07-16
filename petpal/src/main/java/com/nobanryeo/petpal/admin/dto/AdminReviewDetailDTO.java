package com.nobanryeo.petpal.admin.dto;

import java.util.Date;

public class AdminReviewDetailDTO {
	private String userId;
	private String userName;
	private String boardTitle;
	private java.util.Date postDate;
	private String state;
	private String adminId;
	private String adminName;
	private String reason;
	
	
	public AdminReviewDetailDTO() {
		// TODO Auto-generated constructor stub
	}


	public AdminReviewDetailDTO(String userId, String userName, String boardTitle, Date postDate, String state,
			String adminId, String adminName, String reason) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.postDate = postDate;
		this.state = state;
		this.adminId = adminId;
		this.adminName = adminName;
		this.reason = reason;
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


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
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


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	@Override
	public String toString() {
		return "AdminReviewDetailDTO [userId=" + userId + ", userName=" + userName + ", boardTitle=" + boardTitle
				+ ", postDate=" + postDate + ", state=" + state + ", adminId=" + adminId + ", adminName=" + adminName
				+ ", reason=" + reason + "]";
	}

	
	
	
	
	
}
