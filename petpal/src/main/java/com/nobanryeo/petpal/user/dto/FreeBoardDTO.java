package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class FreeBoardDTO {

	private int boardCode;
	private String boardTitle;
	private String boardContent;
	private int boardViews;
	private Date boardPostDate;
	private String boardDeleteYn;
	private int userCode;
	private String userNickName;
	private String category;
	
	public FreeBoardDTO() {}

	public FreeBoardDTO(int boardCode, String boardTitle, String boardContent, int boardViews, Date boardPostDate,
			String boardDeleteYn, int userCode, String userNickName, String category) {
		super();
		this.boardCode = boardCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardViews = boardViews;
		this.boardPostDate = boardPostDate;
		this.boardDeleteYn = boardDeleteYn;
		this.userCode = userCode;
		this.userNickName = userNickName;
		this.category = category;
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

	public int getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public Date getBoardPostDate() {
		return boardPostDate;
	}

	public void setBoardPostDate(Date boardPostDate) {
		this.boardPostDate = boardPostDate;
	}

	public String getBoardDeleteYn() {
		return boardDeleteYn;
	}

	public void setBoardDeleteYn(String boardDeleteYn) {
		this.boardDeleteYn = boardDeleteYn;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "FreeBoardDTO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardViews=" + boardViews + ", boardPostDate=" + boardPostDate + ", boardDeleteYn=" + boardDeleteYn
				+ ", userCode=" + userCode + ", userNickName=" + userNickName + ", category=" + category + "]";
	}
	
}
