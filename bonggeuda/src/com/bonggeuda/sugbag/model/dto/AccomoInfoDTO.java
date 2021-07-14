package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class AccomoInfoDTO {
	
	
	private int accomoNo;
	private int ownerNo;
	private String accomoName;
	private String ceoName;
	private String type;
	private String resgstrationNo;
	private String address;
	private String email;
	private String homepage;
	private String facility;
	private String path;
	private String near;
	private String rule;
	private String parking;
	private String checkIn;
	private String checkOut;
	private Date peakStart;
	private Date peakEnd;
	
	private int minPrice;
	private double reviewScore;
	
	private AttachmentDTO attachment;

	public AccomoInfoDTO() {}

	public AccomoInfoDTO(int accomoNo, int ownerNo, String accomoName, String ceoName, String type,
			String resgstrationNo, String address, String email, String homepage, String facility, String path,
			String near, String rule, String parking, String checkIn, String checkOut, Date peakStart, Date peakEnd,
			int minPrice, double reviewScore, AttachmentDTO attachment) {
		super();
		this.accomoNo = accomoNo;
		this.ownerNo = ownerNo;
		this.accomoName = accomoName;
		this.ceoName = ceoName;
		this.type = type;
		this.resgstrationNo = resgstrationNo;
		this.address = address;
		this.email = email;
		this.homepage = homepage;
		this.facility = facility;
		this.path = path;
		this.near = near;
		this.rule = rule;
		this.parking = parking;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.peakStart = peakStart;
		this.peakEnd = peakEnd;
		this.minPrice = minPrice;
		this.reviewScore = reviewScore;
		this.attachment = attachment;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getResgstrationNo() {
		return resgstrationNo;
	}

	public void setResgstrationNo(String resgstrationNo) {
		this.resgstrationNo = resgstrationNo;
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

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
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

	public Date getPeakStart() {
		return peakStart;
	}

	public void setPeakStart(Date peakStart) {
		this.peakStart = peakStart;
	}

	public Date getPeakEnd() {
		return peakEnd;
	}

	public void setPeakEnd(Date peakEnd) {
		this.peakEnd = peakEnd;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public double getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(double reviewScore) {
		this.reviewScore = reviewScore;
	}

	public AttachmentDTO getAttachment() {
		return attachment;
	}

	public void setAttachment(AttachmentDTO attachment) {
		this.attachment = attachment;
	}

	@Override
	public String toString() {
		return "AccomoInfoDTO [accomoNo=" + accomoNo + ", ownerNo=" + ownerNo + ", accomoName=" + accomoName
				+ ", ceoName=" + ceoName + ", type=" + type + ", resgstrationNo=" + resgstrationNo + ", address="
				+ address + ", email=" + email + ", homepage=" + homepage + ", facility=" + facility + ", path=" + path
				+ ", near=" + near + ", rule=" + rule + ", parking=" + parking + ", checkIn=" + checkIn + ", checkOut="
				+ checkOut + ", peakStart=" + peakStart + ", peakEnd=" + peakEnd + ", minPrice=" + minPrice
				+ ", reviewScore=" + reviewScore + ", attachment=" + attachment + "]";
	}

	

	

	
	
	
	
}
