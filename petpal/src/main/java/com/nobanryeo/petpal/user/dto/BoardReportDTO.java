package com.nobanryeo.petpal.user.dto;

public class BoardReportDTO {

	private int boardCode;
	private int reportCode;
	
	public BoardReportDTO() {}

	public BoardReportDTO(int boardCode, int reportCode) {
		super();
		this.boardCode = boardCode;
		this.reportCode = reportCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	@Override
	public String toString() {
		return "BoardReportDTO [boardCode=" + boardCode + ", reportCode=" + reportCode + "]";
	}

}
