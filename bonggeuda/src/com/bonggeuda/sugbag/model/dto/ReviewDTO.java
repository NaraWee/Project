package com.bonggeuda.sugbag.model.dto;

import java.util.List;

public class ReviewDTO {

	//리뷰정보
	private int reviewNo;
	private String title;
	private String content;
	private int starPoint;
	private int bookNo;
	private String nickName;
	//리뷰이력
	private int historyNo;
	private String updownStatus; //리뷰 상태(U:좋아요,D:싫어요,N:없음)
	private int userNo; // 리뷰누른 회원번호
	private int upCnt; //좋아요 수
	private int downCnt; //싫어요 수
    //리뷰사진
	private AttachmentDTO attachment;
	private List<AttachmentDTO> attachmentList; //리뷰첨부사진

	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int reviewNo, String title, String content, int starPoint, int bookNo, String nickName,
			int historyNo, String updownStatus, int userNo, int upCnt, int downCnt, AttachmentDTO attachment,
			List<AttachmentDTO> attachmentList) {
		super();
		this.reviewNo = reviewNo;
		this.title = title;
		this.content = content;
		this.starPoint = starPoint;
		this.bookNo = bookNo;
		this.nickName = nickName;
		this.historyNo = historyNo;
		this.updownStatus = updownStatus;
		this.userNo = userNo;
		this.upCnt = upCnt;
		this.downCnt = downCnt;
		this.attachment = attachment;
		this.attachmentList = attachmentList;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	public String getUpdownStatus() {
		return updownStatus;
	}

	public void setUpdownStatus(String updownStatus) {
		this.updownStatus = updownStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUpCnt() {
		return upCnt;
	}

	public void setUpCnt(int upCnt) {
		this.upCnt = upCnt;
	}

	public int getDownCnt() {
		return downCnt;
	}

	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
	}

	public AttachmentDTO getAttachment() {
		return attachment;
	}

	public void setAttachment(AttachmentDTO attachment) {
		this.attachment = attachment;
	}

	public List<AttachmentDTO> getAttachmentList() {
		return attachmentList;
	}

	public void setAttachmentList(List<AttachmentDTO> attachmentList) {
		this.attachmentList = attachmentList;
	}

	@Override
	public String toString() {
		return "ReviewDTO [reviewNo=" + reviewNo + ", title=" + title + ", content=" + content + ", starPoint="
				+ starPoint + ", bookNo=" + bookNo + ", nickName=" + nickName + ", historyNo=" + historyNo
				+ ", updownStatus=" + updownStatus + ", userNo=" + userNo + ", upCnt=" + upCnt + ", downCnt=" + downCnt
				+ ", attachment=" + attachment + ", attachmentList=" + attachmentList + "]";
	}

	
}
