package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class NoticeDTO {

	private int noticeNo;
	private String noticeContent;
	private Date noticeWriteDate;
	private int userNo;
	private String noticeTitle;
	
	public NoticeDTO() {}

	public NoticeDTO(int noticeNo, String noticeContent, Date noticeWriteDate, int userNo, String noticeTitle) {
		super();
		this.noticeNo = noticeNo;
		this.noticeContent = noticeContent;
		this.noticeWriteDate = noticeWriteDate;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}

	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeContent=" + noticeContent + ", noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
				+ ", noticeWriteDate=" + noticeWriteDate + ", userNo=" + userNo + "]";
	}

}
