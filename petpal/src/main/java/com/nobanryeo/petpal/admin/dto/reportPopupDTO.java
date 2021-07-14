package com.nobanryeo.petpal.admin.dto;

public class reportPopupDTO {
	private int boardCode;
	private String userId;
	private String userName;
	private String boardTitle;
	private String boardContent;
	private String mapname;
	private String mapValue;
	private String pictureCode;
	private String pictureDeleteYN;
	private String pictureNewName;
	private String pictureUtilPath;
	
	public reportPopupDTO() {
		// TODO Auto-generated constructor stub
	}

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

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getMapname() {
		return mapname;
	}

	public void setMapname(String mapname) {
		this.mapname = mapname;
	}

	public String getMapValue() {
		return mapValue;
	}

	public void setMapValue(String mapValue) {
		this.mapValue = mapValue;
	}

	public String getPictureCode() {
		return pictureCode;
	}

	public void setPictureCode(String pictureCode) {
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

	public reportPopupDTO(int boardCode, String userId, String userName, String boardTitle, String boardContent,
			String mapname, String mapValue, String pictureCode, String pictureDeleteYN, String pictureNewName,
			String pictureUtilPath) {
		super();
		this.boardCode = boardCode;
		this.userId = userId;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.mapname = mapname;
		this.mapValue = mapValue;
		this.pictureCode = pictureCode;
		this.pictureDeleteYN = pictureDeleteYN;
		this.pictureNewName = pictureNewName;
		this.pictureUtilPath = pictureUtilPath;
	}

	@Override
	public String toString() {
		return "reportPopupDTO [boardCode=" + boardCode + ", userId=" + userId + ", userName=" + userName
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", mapname=" + mapname
				+ ", mapValue=" + mapValue + ", pictureCode=" + pictureCode + ", pictureDeleteYN=" + pictureDeleteYN
				+ ", pictureNewName=" + pictureNewName + ", pictureUtilPath=" + pictureUtilPath + "]";
	}

	
	
	
	
}
