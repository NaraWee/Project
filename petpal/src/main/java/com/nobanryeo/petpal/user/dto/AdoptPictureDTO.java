package com.nobanryeo.petpal.user.dto;

public class AdoptPictureDTO {

	private int boardCode;
	private int pictureCode;
	
	
	public AdoptPictureDTO() {}


	public AdoptPictureDTO(int boardCode, int pictureCode) {
		super();
		this.boardCode = boardCode;
		this.pictureCode = pictureCode;
	}


	public int getBoardCode() {
		return boardCode;
	}


	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}


	public int getPictureCode() {
		return pictureCode;
	}


	public void setPictureCode(int pictureCode) {
		this.pictureCode = pictureCode;
	}


	@Override
	public String toString() {
		return "AdoptPictureDTO [boardCode=" + boardCode + ", pictureCode=" + pictureCode + "]";
	}
	
	
	

}
