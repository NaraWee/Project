package com.nobanryeo.petpal.user.dto;

public class BoardReplyDTO {

	private int boardCode;
	private int replyCode;
	private int userCode;
	
	public BoardReplyDTO() {}

	public BoardReplyDTO(int boardCode, int replyCode, int userCode) {
		super();
		this.boardCode = boardCode;
		this.replyCode = replyCode;
		this.userCode = userCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "BoardReplyDTO [boardCode=" + boardCode + ", replyCode=" + replyCode + ", userCode=" + userCode + "]";
	}	
	
}
