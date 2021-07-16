package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class AdoptPictureManageDTO {

	private int boardCode;
	private String adoptBreed;
	private String adoptGender;
	private String adoptColor;
	private String deleteYN;
	private String stateName;
	private String dogOrcat;
	private String userAddress;
	private String userCode;
	private String userNickname;
	private Date boardDate;
	private int pictureCode;
	private String pictureURL;
	private String pictureDeleteYN;
	private String pictureName;
	private String pictureNewName;
	private String pictureUtilPath;
	
	public AdoptPictureManageDTO() {}

	public AdoptPictureManageDTO(int boardCode, String adoptBreed, String adoptGender, String adoptColor,
			String deleteYN, String stateName, String dogOrcat, String userAddress, String userCode,
			String userNickname, Date boardDate, int pictureCode, String pictureURL, String pictureDeleteYN,
			String pictureName, String pictureNewName, String pictureUtilPath) {
		super();
		this.boardCode = boardCode;
		this.adoptBreed = adoptBreed;
		this.adoptGender = adoptGender;
		this.adoptColor = adoptColor;
		this.deleteYN = deleteYN;
		this.stateName = stateName;
		this.dogOrcat = dogOrcat;
		this.userAddress = userAddress;
		this.userCode = userCode;
		this.userNickname = userNickname;
		this.boardDate = boardDate;
		this.pictureCode = pictureCode;
		this.pictureURL = pictureURL;
		this.pictureDeleteYN = pictureDeleteYN;
		this.pictureName = pictureName;
		this.pictureNewName = pictureNewName;
		this.pictureUtilPath = pictureUtilPath;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getAdoptBreed() {
		return adoptBreed;
	}

	public void setAdoptBreed(String adoptBreed) {
		this.adoptBreed = adoptBreed;
	}

	public String getAdoptGender() {
		return adoptGender;
	}

	public void setAdoptGender(String adoptGender) {
		this.adoptGender = adoptGender;
	}

	public String getAdoptColor() {
		return adoptColor;
	}

	public void setAdoptColor(String adoptColor) {
		this.adoptColor = adoptColor;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getDogOrcat() {
		return dogOrcat;
	}

	public void setDogOrcat(String dogOrcat) {
		this.dogOrcat = dogOrcat;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getPictureCode() {
		return pictureCode;
	}

	public void setPictureCode(int pictureCode) {
		this.pictureCode = pictureCode;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public String getPictureDeleteYN() {
		return pictureDeleteYN;
	}

	public void setPictureDeleteYN(String pictureDeleteYN) {
		this.pictureDeleteYN = pictureDeleteYN;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
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
		return "AdoptPictureManageDTO [boardCode=" + boardCode + ", adoptBreed=" + adoptBreed + ", adoptGender="
				+ adoptGender + ", adoptColor=" + adoptColor + ", deleteYN=" + deleteYN + ", stateName=" + stateName
				+ ", dogOrcat=" + dogOrcat + ", userAddress=" + userAddress + ", userCode=" + userCode
				+ ", userNickname=" + userNickname + ", boardDate=" + boardDate + ", pictureCode=" + pictureCode
				+ ", pictureURL=" + pictureURL + ", pictureDeleteYN=" + pictureDeleteYN + ", pictureName=" + pictureName
				+ ", pictureNewName=" + pictureNewName + ", pictureUtilPath=" + pictureUtilPath + "]";
	}

	
}
