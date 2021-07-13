package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class EventDTO {
	
	private int evnetNo;
	private String eventTitle;
	private Date eventStart;
	private Date eventEnd;
	private int userNo;
	private String thumbnailPath;
	
	public EventDTO() {}

	public EventDTO(int evnetNo, String eventTitle, Date eventStart, Date eventEnd, int userNo, String thumbnailPath) {
		super();
		this.evnetNo = evnetNo;
		this.eventTitle = eventTitle;
		this.eventStart = eventStart;
		this.eventEnd = eventEnd;
		this.userNo = userNo;
		this.thumbnailPath = thumbnailPath;
	}

	public int getEvnetNo() {
		return evnetNo;
	}

	public void setEvnetNo(int evnetNo) {
		this.evnetNo = evnetNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Date getEventStart() {
		return eventStart;
	}

	public void setEventStart(Date eventStart) {
		this.eventStart = eventStart;
	}

	public Date getEventEnd() {
		return eventEnd;
	}

	public void setEventEnd(Date eventEnd) {
		this.eventEnd = eventEnd;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getThumbnailPath() {
		return thumbnailPath;
	}

	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}

	@Override
	public String toString() {
		return "EventDTO [evnetNo=" + evnetNo + ", eventTitle=" + eventTitle + ", eventStart=" + eventStart
				+ ", eventEnd=" + eventEnd + ", userNo=" + userNo + ", thumbnailPath=" + thumbnailPath + "]";
	}
	
}
