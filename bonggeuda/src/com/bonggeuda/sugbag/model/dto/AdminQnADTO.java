package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class AdminQnADTO {

	private int adminQnANo;
	private String adminQnATitle;
	private Date adminQnADate;
	private String adminAnswerYn;
	private String adminQnAWriter;
	private String adminQnAContent;
	private int memberNo;
	private String answerContent;
	private Date answerDate;
	
	public AdminQnADTO() {}

	public AdminQnADTO(int adminQnANo, String adminQnATitle, Date adminQnADate, String adminAnswerYn,
			String adminQnAWriter, String adminQnAContent, int memberNo, String answerContent, Date answerDate) {
		super();
		this.adminQnANo = adminQnANo;
		this.adminQnATitle = adminQnATitle;
		this.adminQnADate = adminQnADate;
		this.adminAnswerYn = adminAnswerYn;
		this.adminQnAWriter = adminQnAWriter;
		this.adminQnAContent = adminQnAContent;
		this.memberNo = memberNo;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
	}

	public int getAdminQnANo() {
		return adminQnANo;
	}

	public void setAdminQnANo(int adminQnANo) {
		this.adminQnANo = adminQnANo;
	}

	public String getAdminQnATitle() {
		return adminQnATitle;
	}

	public void setAdminQnATitle(String adminQnATitle) {
		this.adminQnATitle = adminQnATitle;
	}

	public Date getAdminQnADate() {
		return adminQnADate;
	}

	public void setAdminQnADate(Date adminQnADate) {
		this.adminQnADate = adminQnADate;
	}

	public String getAdminAnswerYn() {
		return adminAnswerYn;
	}

	public void setAdminAnswerYn(String adminAnswerYn) {
		this.adminAnswerYn = adminAnswerYn;
	}

	public String getAdminQnAWriter() {
		return adminQnAWriter;
	}

	public void setAdminQnAWriter(String adminQnAWriter) {
		this.adminQnAWriter = adminQnAWriter;
	}

	public String getAdminQnAContent() {
		return adminQnAContent;
	}

	public void setAdminQnAContent(String adminQnAContent) {
		this.adminQnAContent = adminQnAContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	@Override
	public String toString() {
		return "AdminQnADTO [adminQnANo=" + adminQnANo + ", adminQnATitle=" + adminQnATitle + ", adminQnADate="
				+ adminQnADate + ", adminAnswerYn=" + adminAnswerYn + ", adminQnAWriter=" + adminQnAWriter
				+ ", adminQnAContent=" + adminQnAContent + ", memberNo=" + memberNo + ", answerContent=" + answerContent
				+ ", answerDate=" + answerDate + "]";
	}

}
