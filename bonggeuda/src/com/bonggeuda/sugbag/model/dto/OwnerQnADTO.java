package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class OwnerQnADTO {
	
	private int qnaNo;
	private String title;
	private String content;
	private Date writeDate;
	private String answerYN;
	private int accomoNo;
	private int userNo;
	private String accomoName;
	private String ownerAnswerContent;

	public OwnerQnADTO() {
		super();
	}

	public OwnerQnADTO(int qnaNo, String title, String content, Date writeDate, String answerYN, int accomoNo,
			int userNo, String accomoName, String ownerAnswerContent) {
		super();
		this.qnaNo = qnaNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.answerYN = answerYN;
		this.accomoNo = accomoNo;
		this.userNo = userNo;
		this.accomoName = accomoName;
		this.ownerAnswerContent = ownerAnswerContent;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getAnswerYN() {
		return answerYN;
	}

	public void setAnswerYN(String answerYN) {
		this.answerYN = answerYN;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}

	public String getOwnerAnswerContent() {
		return ownerAnswerContent;
	}

	public void setOwnerAnswerContent(String ownerAnswerContent) {
		this.ownerAnswerContent = ownerAnswerContent;
	}

	@Override
	public String toString() {
		return "OwnerQnADTO [qnaNo=" + qnaNo + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", answerYN=" + answerYN + ", accomoNo=" + accomoNo + ", userNo=" + userNo + ", accomoName="
				+ accomoName + ", ownerAnswerContent=" + ownerAnswerContent + "]";
	}

}
