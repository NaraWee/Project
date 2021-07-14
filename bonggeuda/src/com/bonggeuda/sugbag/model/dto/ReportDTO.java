package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;
import java.util.List;

public class ReportDTO {

	private int reportNo;
	private String writerType;
	private String reportReason;
	private int memberNo;
	private Date reportDate;
	private String reportTitle;
	private String reportStatus;
	private String reportedType;
	private int reportedNo;
	private String accomoName;
	private String reportAnswer;
	private String approveYN; // 연준 추가
	private int rowNum;

	private List<AttachmentDTO> attachmentList; // 신고첨부사진

	public ReportDTO() {
		super();
	}

	public ReportDTO(int reportNo, String writerType, String reportReason, int memberNo, Date reportDate,
			String reportTitle, String reportStatus, String reportedType, int reportedNo, String accomoName,
			String reportAnswer, String approveYN, int rowNum, List<AttachmentDTO> attachmentList) {
		super();
		this.reportNo = reportNo;
		this.writerType = writerType;
		this.reportReason = reportReason;
		this.memberNo = memberNo;
		this.reportDate = reportDate;
		this.reportTitle = reportTitle;
		this.reportStatus = reportStatus;
		this.reportedType = reportedType;
		this.reportedNo = reportedNo;
		this.accomoName = accomoName;
		this.reportAnswer = reportAnswer;
		this.approveYN = approveYN;
		this.rowNum = rowNum;
		this.attachmentList = attachmentList;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getWriterType() {
		return writerType;
	}

	public void setWriterType(String writerType) {
		this.writerType = writerType;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getReportedType() {
		return reportedType;
	}

	public void setReportedType(String reportedType) {
		this.reportedType = reportedType;
	}

	public int getReportedNo() {
		return reportedNo;
	}

	public void setReportedNo(int reportedNo) {
		this.reportedNo = reportedNo;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}

	public String getReportAnswer() {
		return reportAnswer;
	}

	public void setReportAnswer(String reportAnswer) {
		this.reportAnswer = reportAnswer;
	}

	public String getApproveYN() {
		return approveYN;
	}

	public void setApproveYN(String approveYN) {
		this.approveYN = approveYN;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public List<AttachmentDTO> getAttachmentList() {
		return attachmentList;
	}

	public void setAttachmentList(List<AttachmentDTO> attachmentList) {
		this.attachmentList = attachmentList;
	}

	@Override
	public String toString() {
		return "ReportDTO [reportNo=" + reportNo + ", writerType=" + writerType + ", reportReason=" + reportReason
				+ ", memberNo=" + memberNo + ", reportDate=" + reportDate + ", reportTitle=" + reportTitle
				+ ", reportStatus=" + reportStatus + ", reportedType=" + reportedType + ", reportedNo=" + reportedNo
				+ ", accomoName=" + accomoName + ", reportAnswer=" + reportAnswer + ", approveYN=" + approveYN
				+ ", rowNum=" + rowNum + ", attachmentList=" + attachmentList + "]";
	}
	
}
