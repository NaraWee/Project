package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class ShareFreeDTO {
	
	private int boardCode;
	private String boardTitle;
	private String boardContent;
	private String boardDeleteYn;
	private int boardViews;
	private Date boardDate;
	private int stateCode;
	private String stateName;
	private int userCode;
	private String userNickname;
	private int pictureCode;
	private String pictureDeleteYN;
	private String pictureNewName;
	private String pictureUtilPath;

	
	
	public ShareFreeDTO() {}



	public ShareFreeDTO(int boardCode, String boardTitle, String boardContent, String boardDeleteYn, int boardViews,
			Date boardDate, int stateCode, String stateName, int userCode, String userNickname, int pictureCode,
			String pictureDeleteYN, String pictureNewName, String pictureUtilPath) {
		super();
		this.boardCode = boardCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDeleteYn = boardDeleteYn;
		this.boardViews = boardViews;
		this.boardDate = boardDate;
		this.stateCode = stateCode;
		this.stateName = stateName;
		this.userCode = userCode;
		this.userNickname = userNickname;
		this.pictureCode = pictureCode;
		this.pictureDeleteYN = pictureDeleteYN;
		this.pictureNewName = pictureNewName;
		this.pictureUtilPath = pictureUtilPath;
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



	public String getBoardDeleteYn() {
		return boardDeleteYn;
	}



	public void setBoardDeleteYn(String boardDeleteYn) {
		this.boardDeleteYn = boardDeleteYn;
	}



	public int getBoardViews() {
		return boardViews;
	}



	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}



	public Date getBoardDate() {
		return boardDate;
	}



	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}



	public int getStateCode() {
		return stateCode;
	}



	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}



	public String getStateName() {
		return stateName;
	}



	public void setStateName(String stateName) {
		this.stateName = stateName;
	}



	public int getUserCode() {
		return userCode;
	}



	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}



	public String getUserNickname() {
		return userNickname;
	}



	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}



	public int getPictureCode() {
		return pictureCode;
	}



	public void setPictureCode(int pictureCode) {
		this.pictureCode = pictureCode;
	}



	public String getPictureDeleteYN() {
		return pictureDeleteYN;
	}



	public void setPictureDeleteYN(String pictureDeleteYN) {
		this.pictureDeleteYN = pictureDeleteYN;
	}



	public String getPictureNewName() {
		return pictureNewName;
	}



	public void setPictureNewName(String pictureNewName) {
		this.pictureNewName = pictureNewName;
	}



	public String getPictureUtilPath() {
		return pictureUtilPath;
	}



	public void setPictureUtilPath(String pictureUtilPath) {
		this.pictureUtilPath = pictureUtilPath;
	}



	@Override
	public String toString() {
		return "ShareFreeDTO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDeleteYn=" + boardDeleteYn + ", boardViews=" + boardViews + ", boardDate=" + boardDate
				+ ", stateCode=" + stateCode + ", stateName=" + stateName + ", userCode=" + userCode + ", userNickname="
				+ userNickname + ", pictureCode=" + pictureCode + ", pictureDeleteYN=" + pictureDeleteYN
				+ ", pictureNewName=" + pictureNewName + ", pictureUtilPath=" + pictureUtilPath + "]";
	}


	
	
}
