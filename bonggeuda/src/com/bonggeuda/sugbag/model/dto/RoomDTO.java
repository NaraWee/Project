package com.bonggeuda.sugbag.model.dto;

import java.util.List;


public class RoomDTO {

	private int roomNo; 		// 객실번호
	private int accomoNo; 		// 숙소번호
	private String roomName;	// 객실명
	private int roomMax; 		// 객실정원
	private String roomIntro; 	// 객실소개글
	private int roomFee; 		// 객실요금
	private String visibleYn; 	// 공개여부
	private int peakFee;		// 성수기요금

	private AttachmentDTO attachment;

	private List<AttachmentDTO> attachmentList;
	
	private String imagePath;
	
	private int requestNo;
	
	public RoomDTO() {}

	public RoomDTO(int roomNo, int accomoNo, String roomName, int roomMax, String roomIntro, int roomFee,
			String visibleYn, int peakFee, AttachmentDTO attachment, List<AttachmentDTO> attachmentList,
			String imagePath, int requestNo) {
		super();
		this.roomNo = roomNo;
		this.accomoNo = accomoNo;
		this.roomName = roomName;
		this.roomMax = roomMax;
		this.roomIntro = roomIntro;
		this.roomFee = roomFee;
		this.visibleYn = visibleYn;
		this.peakFee = peakFee;
		this.attachment = attachment;
		this.attachmentList = attachmentList;
		this.imagePath = imagePath;
		this.requestNo = requestNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomMax() {
		return roomMax;
	}

	public void setRoomMax(int roomMax) {
		this.roomMax = roomMax;
	}

	public String getRoomIntro() {
		return roomIntro;
	}

	public void setRoomIntro(String roomIntro) {
		this.roomIntro = roomIntro;
	}

	public int getRoomFee() {
		return roomFee;
	}

	public void setRoomFee(int roomFee) {
		this.roomFee = roomFee;
	}

	public String getVisibleYn() {
		return visibleYn;
	}

	public void setVisibleYn(String visibleYn) {
		this.visibleYn = visibleYn;
	}

	public int getPeakFee() {
		return peakFee;
	}

	public void setPeakFee(int peakFee) {
		this.peakFee = peakFee;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", accomoNo=" + accomoNo + ", roomName=" + roomName + ", roomMax="
				+ roomMax + ", roomIntro=" + roomIntro + ", roomFee=" + roomFee + ", visibleYn=" + visibleYn
				+ ", peakFee=" + peakFee + ", attachment=" + attachment + ", attachmentList=" + attachmentList
				+ ", imagePath=" + imagePath + ", requestNo=" + requestNo + "]";
	}

	

	
	
	
}