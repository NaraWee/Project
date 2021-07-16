package com.bonggeuda.sugbag.adminQnAReport.dto;

import java.sql.Date;

public class QnADTO {

	private int rnum;
	private int qnaNo;
	private String title;
	private String content;
	private java.sql.Date writeDate;
	private String answerYn;
	private String writer;
	private int memberNo;
	
	public QnADTO() {
		
	}

	public QnADTO(int rnum, int qnaNo, String title, String content, Date writeDate, String answerYn, String writer,
			int memberNo) {
		super();
		this.rnum = rnum;
		this.qnaNo = qnaNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.answerYn = answerYn;
		this.writer = writer;
		this.memberNo = memberNo;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getAnswerYn() {
		return answerYn;
	}

	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "QnADTO [rnum=" + rnum + ", qnaNo=" + qnaNo + ", title=" + title + ", content=" + content
				+ ", writeDate=" + writeDate + ", answerYn=" + answerYn + ", writer=" + writer + ", memberNo="
				+ memberNo + "]";
	}

	

	
	
}
