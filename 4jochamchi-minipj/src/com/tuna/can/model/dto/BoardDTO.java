package com.tuna.can.model.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * <pre>
 * 	게시글 목록과 게시글 삽입을 위한 BoardDTO
 * </pre>
 * @author Hyelim Jeon
 *
 */
public class BoardDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6741550132732687627L;
	
	private int boardNo;
	private String userId;
	private Date boardDate;
	private String title;
	private String boardContent;
	private int listNo;
	private int userNo;
	
	
	public BoardDTO() {
	super();
		
	}
	
	
	public BoardDTO(int boardNo, String userId, Date boardDate, String title, String boardContent, int listNo,
			int userNo) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.boardDate = boardDate;
		this.title = title;
		this.boardContent = boardContent;
		this.listNo = listNo;
		this.userNo = userNo;
	}


	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}



	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", userId=" + userId + ", boardDate=" + boardDate + ", title=" + title
				+ ", boardContent=" + boardContent + ", listNo=" + listNo + ", userNo=" + userNo + "]";
	}


}
