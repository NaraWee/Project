package com.nobanryeo.petpal.user.dto;

import java.sql.Date;
import java.util.List;

public class PictureDTO {

	private int pictureCode;
	private String pictureName;
	private String pictureURL;
	private Date pictureUploadDate;
	private String pictureDeleteYN;
	private String pictureNewName;
	private int boardCode;
	private String pictureUtilPath;
	private int userCode;
	private List<PictureDTO> pictureCodeList;
	
	public PictureDTO() {}

	public PictureDTO(int pictureCode, String pictureName, String pictureURL, Date pictureUploadDate,
			String pictureDeleteYN, String pictureNewName, int boardCode, String pictureUtilPath, int userCode,
			List<PictureDTO> pictureCodeList) {
		super();
		this.pictureCode = pictureCode;
		this.pictureName = pictureName;
		this.pictureURL = pictureURL;
		this.pictureUploadDate = pictureUploadDate;
		this.pictureDeleteYN = pictureDeleteYN;
		this.pictureNewName = pictureNewName;
		this.boardCode = boardCode;
		this.pictureUtilPath = pictureUtilPath;
		this.userCode = userCode;
		this.pictureCodeList = pictureCodeList;
	}

	public int getPictureCode() {
		return pictureCode;
	}

	public void setPictureCode(int pictureCode) {
		this.pictureCode = pictureCode;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public Date getPictureUploadDate() {
		return pictureUploadDate;
	}

	public void setPictureUploadDate(Date pictureUploadDate) {
		this.pictureUploadDate = pictureUploadDate;
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

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getPictureUtilPath() {
		return pictureUtilPath;
	}

	public void setPictureUtilPath(String pictureUtilPath) {
		this.pictureUtilPath = pictureUtilPath;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public List<PictureDTO> getPictureCodeList() {
		return pictureCodeList;
	}

	public void setPictureCodeList(List<PictureDTO> pictureCodeList) {
		this.pictureCodeList = pictureCodeList;
	}

	@Override
	public String toString() {
		return "PictureDTO [pictureCode=" + pictureCode + ", pictureName=" + pictureName + ", pictureURL=" + pictureURL
				+ ", pictureUploadDate=" + pictureUploadDate + ", pictureDeleteYN=" + pictureDeleteYN
				+ ", pictureNewName=" + pictureNewName + ", boardCode=" + boardCode + ", pictureUtilPath="
				+ pictureUtilPath + ", userCode=" + userCode + ", pictureCodeList=" + pictureCodeList + "]";
	}



}
