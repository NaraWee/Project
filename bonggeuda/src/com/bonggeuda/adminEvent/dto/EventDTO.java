package com.bonggeuda.adminEvent.dto;

import java.sql.Date;
import java.util.List;

import com.bonggeuda.sugbag.model.dto.AttachmentDTO;

public class EventDTO {
	
	private int rnum;
	private int number;
	private String title;
	private java.sql.Date startDate;
	private java.sql.Date endDate;
	private String thumnailPath;
    //리뷰사진
	private AttachmentDTO attachment;
	private List<AttachmentDTO> attachmentList; //리뷰첨부사진
	
	public EventDTO() {
		
	}

	public EventDTO(int rnum, int number, String title, Date startDate, Date endDate, String thumnailPath,
			AttachmentDTO attachment, List<AttachmentDTO> attachmentList) {
		super();
		this.rnum = rnum;
		this.number = number;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.thumnailPath = thumnailPath;
		this.attachment = attachment;
		this.attachmentList = attachmentList;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public java.sql.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public String getThumnailPath() {
		return thumnailPath;
	}

	public void setThumnailPath(String thumnailPath) {
		this.thumnailPath = thumnailPath;
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
		return "EventDTO [rnum=" + rnum + ", number=" + number + ", title=" + title + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", thumnailPath=" + thumnailPath + ", attachment=" + attachment
				+ ", attachmentList=" + attachmentList + "]";
	}



	
	
	
	
}
