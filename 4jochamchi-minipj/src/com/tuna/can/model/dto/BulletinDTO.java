package com.tuna.can.model.dto;

import java.sql.Date;

/**
 * <pre>
 * 	게시글 내용과 그에 관련된 내용을 불러오기위한 BulletinDTO
 * </pre>
 * @author WEENARA
 *
 */
public class BulletinDTO {

	private String title;
	private String boardContents;
	private String userNickname;
	private String enrollDate;
	private int userNo;
	private int listNo;
	
	
	public BulletinDTO() {
		super();
	}

	public BulletinDTO(String title, String boardContents, String userNickname, String enrollDate, int userNo,
			int listNo) {
		super();
		this.title = title;
		this.boardContents = boardContents;
		this.userNickname = userNickname;
		this.enrollDate = enrollDate;
		this.userNo = userNo;
		this.listNo = listNo;
	}


	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getBoardContents() {
		return boardContents;
	}


	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}


	public String getUserNickname() {
		return userNickname;
	}


	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "BulletinDTO [title=" + title + ", boardContents=" + boardContents + ", userNickname=" + userNickname
				+ ", enrollDate=" + enrollDate + ", userNo=" + userNo + ", listNo=" + listNo + "]";
	}

	
	
}
