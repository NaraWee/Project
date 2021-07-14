package com.tuna.can.model.dto;

/**
 * <pre>
 *  댓글 쓰기 및 읽어들어오기 위한 CommentDTO
 * </pre>
 * @author WEENARA
 *
 */
public class CommentDTO {
	
	private String commentContent;
	private String userNickname;
	private int commentNo;
	private int boardNo;
	private int userNo;
	
	public CommentDTO() {
		super();
	}

	public CommentDTO(String commentContent, String userNickname, int commentNo, int boardNo, int userNo) {
		super();
		this.commentContent = commentContent;
		this.userNickname = userNickname;
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
	}

	

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "CommentDTO [commentContent=" + commentContent + ", userNickname=" + userNickname + ", commentNo="
				+ commentNo + ", boardNo=" + boardNo + ", userNo=" + userNo + "]";
	}


}
