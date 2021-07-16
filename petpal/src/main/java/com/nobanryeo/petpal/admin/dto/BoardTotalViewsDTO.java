package com.nobanryeo.petpal.admin.dto;

public class BoardTotalViewsDTO {

	private String boardType;
	private int boardTotalViews;
	
	public BoardTotalViewsDTO() {
		super();
	}

	public BoardTotalViewsDTO(String boardType, int boardTotalViews) {
		super();
		this.boardType = boardType;
		this.boardTotalViews = boardTotalViews;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getBoardTotalViews() {
		return boardTotalViews;
	}

	public void setBoardTotalViews(int boardTotalViews) {
		this.boardTotalViews = boardTotalViews;
	}

	@Override
	public String toString() {
		return "BoardTotalViewsDTO [boardType=" + boardType + ", boardTotalViews=" + boardTotalViews + "]";
	}


	
}
