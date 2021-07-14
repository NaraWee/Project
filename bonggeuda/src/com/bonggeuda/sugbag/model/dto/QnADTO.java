package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;
import java.util.Comparator;

public class QnADTO implements Comparator<QnADTO> {

	private int qnaNo;
	private String qnaTitle;
	private Date qnaDate;
	private String answerYn;
	private String qnaContent;
	private String writer;
	private int rowNum;

	public QnADTO() {
	}

	public QnADTO(int qnaNo, String qnaTitle, Date qnaDate, String answerYn, String qnaContent, String writer,
			int rowNum) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaDate = qnaDate;
		this.answerYn = answerYn;
		this.qnaContent = qnaContent;
		this.writer = writer;
		this.rowNum = rowNum;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getAnswerYn() {
		return answerYn;
	}

	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	@Override
	public String toString() {
		return "QnADTO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaDate=" + qnaDate + ", answerYn=" + answerYn
				+ ", qnaContent=" + qnaContent + ", writer=" + writer + ", rowNum=" + rowNum + "]";
	}
	
	@Override
	public int compare(QnADTO o1, QnADTO o2) {
	     return (o2.getQnaDate()).compareTo(o1.getQnaDate());
	}


}
