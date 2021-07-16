package com.bonggeuda.sugbag.admin.owner.model.dto;

import java.sql.Date;
import java.util.List;

import com.bonggeuda.sugbag.admin.common.dto.AttachmentDTO;

public class AccomoInfoDTO {

	private int requestNo;
	private int accomoNo;
	private int ownerNo;
	private String accomoName;
	private String ceoName;
	private String accomoType;
	private String registrationNo;
	private String address;
	private String email;
	private String homePage;
	private String facility; // 편의시설
	private String path; // 오시는길
	private String near; // 주변정보
	private String rule;
	private String parking;
	private String checkIn;
	private String checkOut;
	private Date peakStartDate;
	private Date peakEndDate;

	private String approvalYn;
	private String rmType;
	
	private int enAccomoNo;
	
	private AttachmentDTO attachment;
	
	private String visibleYn;
	
	private String phone;
	private String ownerEmail;
	
	public AccomoInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public AccomoInfoDTO(int requestNo, int accomoNo, int ownerNo, String accomoName, String ceoName, String accomoType,
			String registrationNo, String address, String email, String homePage, String facility, String path,
			String near, String rule, String parking, String checkIn, String checkOut, Date peakStartDate,
			Date peakEndDate, String approvalYn, String rmType, int enAccomoNo, AttachmentDTO attachment,
			String visibleYn, String phone, String ownerEmail) {
		super();
		this.requestNo = requestNo;
		this.accomoNo = accomoNo;
		this.ownerNo = ownerNo;
		this.accomoName = accomoName;
		this.ceoName = ceoName;
		this.accomoType = accomoType;
		this.registrationNo = registrationNo;
		this.address = address;
		this.email = email;
		this.homePage = homePage;
		this.facility = facility;
		this.path = path;
		this.near = near;
		this.rule = rule;
		this.parking = parking;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.peakStartDate = peakStartDate;
		this.peakEndDate = peakEndDate;
		this.approvalYn = approvalYn;
		this.rmType = rmType;
		this.enAccomoNo = enAccomoNo;
		this.attachment = attachment;
		this.visibleYn = visibleYn;
		this.phone = phone;
		this.ownerEmail = ownerEmail;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public String getAccomoType() {
		return accomoType;
	}

	public void setAccomoType(String accomoType) {
		this.accomoType = accomoType;
	}

	public String getRegistrationNo() {
		return registrationNo;
	}

	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getNear() {
		return near;
	}

	public void setNear(String near) {
		this.near = near;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public Date getPeakStartDate() {
		return peakStartDate;
	}

	public void setPeakStartDate(Date peakStartDate) {
		this.peakStartDate = peakStartDate;
	}

	public Date getPeakEndDate() {
		return peakEndDate;
	}

	public void setPeakEndDate(Date peakEndDate) {
		this.peakEndDate = peakEndDate;
	}

	public String getApprovalYn() {
		return approvalYn;
	}

	public void setApprovalYn(String approvalYn) {
		this.approvalYn = approvalYn;
	}

	public String getRmType() {
		return rmType;
	}

	public void setRmType(String rmType) {
		this.rmType = rmType;
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

	public String getVisibleYn() {
		return visibleYn;
	}

	public void setVisibleYn(String visibleYn) {
		this.visibleYn = visibleYn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOwnerEmail() {
		return ownerEmail;
	}

	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}

	@Override
	public String toString() {
		return "AccomoInfoDTO [requestNo=" + requestNo + ", accomoNo=" + accomoNo + ", ownerNo=" + ownerNo
				+ ", accomoName=" + accomoName + ", ceoName=" + ceoName + ", accomoType=" + accomoType
				+ ", registrationNo=" + registrationNo + ", address=" + address + ", email=" + email + ", homePage="
				+ homePage + ", facility=" + facility + ", path=" + path + ", near=" + near + ", rule=" + rule
				+ ", parking=" + parking + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", peakStartDate="
				+ peakStartDate + ", peakEndDate=" + peakEndDate + ", approvalYn=" + approvalYn + ", rmType=" + rmType
				+ ", enAccomoNo=" + enAccomoNo + ", attachment=" + attachment + ", visibleYn=" + visibleYn + ", phone="
				+ phone + ", ownerEmail=" + ownerEmail + "]";
	}


	

	
}
