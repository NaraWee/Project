package com.bonggeuda.sugbag.admin.owner.model.dto;

import java.util.List;

import com.bonggeuda.sugbag.admin.common.dto.AttachmentDTO;

public class RoomInfoDTO {
//	REQUEST_NO
//	ROOM_NO_RM
//	ACCOMO_NO_RM
//	ROOM_NAME_RM
//	ROOM_MAX_RM
//	ROOM_INTRO_RM
//	ROOM_FEE_RM
//	ROOM_VISIBLE_YN_RM
//	RM_TYPE
	
	private int requestNo;
	private int roomNo;
	private int accomoNo;
	private String roomName;
	private int roomMax; //최대 정원
	private String roomIntro; // 객실 소개
	private int roomFee;
	private String roomVisibleYn;
	private String rmType;
	

	private String approvalYn;
	
	private int enAccomoNo;
	
	private AttachmentDTO attachment;
	
	private int peakFee;
	
	public RoomInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public RoomInfoDTO(int requestNo, int roomNo, int accomoNo, String roomName, int roomMax, String roomIntro,
			int roomFee, String roomVisibleYn, String rmType, String approvalYn, int enAccomoNo,
			AttachmentDTO attachment, int peakFee) {
		super();
		this.requestNo = requestNo;
		this.roomNo = roomNo;
		this.accomoNo = accomoNo;
		this.roomName = roomName;
		this.roomMax = roomMax;
		this.roomIntro = roomIntro;
		this.roomFee = roomFee;
		this.roomVisibleYn = roomVisibleYn;
		this.rmType = rmType;
		this.approvalYn = approvalYn;
		this.enAccomoNo = enAccomoNo;
		this.attachment = attachment;
		this.peakFee = peakFee;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
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

	public String getRoomVisibleYn() {
		return roomVisibleYn;
	}

	public void setRoomVisibleYn(String roomVisibleYn) {
		this.roomVisibleYn = roomVisibleYn;
	}

	public String getRmType() {
		return rmType;
	}

	public void setRmType(String rmType) {
		this.rmType = rmType;
	}

	public String getApprovalYn() {
		return approvalYn;
	}

	public void setApprovalYn(String approvalYn) {
		this.approvalYn = approvalYn;
	}

	public int getEnAccomoNo() {
		return enAccomoNo;
	}

	public void setEnAccomoNo(int enAccomoNo) {
		this.enAccomoNo = enAccomoNo;
	}

	public AttachmentDTO getAttachment() {
		return attachment;
	}

	public void setAttachment(AttachmentDTO attachment) {
		this.attachment = attachment;
	}

	public int getPeakFee() {
		return peakFee;
	}

	public void setPeakFee(int peakFee) {
		this.peakFee = peakFee;
	}

	@Override
	public String toString() {
		return "RoomInfoDTO [requestNo=" + requestNo + ", roomNo=" + roomNo + ", accomoNo=" + accomoNo + ", roomName="
				+ roomName + ", roomMax=" + roomMax + ", roomIntro=" + roomIntro + ", roomFee=" + roomFee
				+ ", roomVisibleYn=" + roomVisibleYn + ", rmType=" + rmType + ", approvalYn=" + approvalYn
				+ ", enAccomoNo=" + enAccomoNo + ", attachment=" + attachment + ", peakFee=" + peakFee + "]";
	}
	
	
}
