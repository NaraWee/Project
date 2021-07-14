package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class RmAccomoInfoDTO {
	
	private int requestNo;      // 요청번호
	private int rmAccomoNo; 		// 숙소번호
	private String accomoName;	// 숙소명(상호명)
	private String ceoName; 	// 대표명
	private String accomoType;  // 업종
	private String registNo; 	// 사업자번호
	private String address; 	// 숙소주소
	private String adrDetail; 	// 숙소 상세주소
	private String email; 		// 세금계산서이메일
	private String homepage; 	// 홈페이지 주소
	private String facility; 	// 편의시설
	private String accomoPath; 	// 오시는길
	private String near; 		// 주변정보
	private String rule; 		// 이용규칙
	private String parking; 	// 주차장
	private String checkIn; 	// 체크인
	private String checkOut; 	// 체크아웃
	private Date peakStart; 	// 성수기시작일
	private Date peakEnd; 		// 성수기종료일
	private int ownerNo; 		// 업체번호
	private String approvalYN;  // 승인여부
	private String rmType;      // 등록 수정 구분
	private int enAccomoNO;     // 등록숙소 요청 번호
	
	
	
	private String thumbNailPath;
	// RM_History Dto 추가
	private String approvalStatus;
	private String insPectionComment;
	// 어코모 디티오 어코모 넘 추가
	private int accomoNo;
	
	
	
	public RmAccomoInfoDTO() { }

	public RmAccomoInfoDTO(int requestNo, int rmAccomoNo, String accomoName, String ceoName, String accomoType,
			String registNo, String address, String adrDetail, String email, String homepage, String facility,
			String accomoPath, String near, String rule, String parking, String checkIn, String checkOut,
			Date peakStart, Date peakEnd, int ownerNo, String approvalYN, String rmType, int enAccomoNO,
			String thumbNailPath, String approvalStatus, String insPectionComment, int accomoNo) {
		super();
		this.requestNo = requestNo;
		this.rmAccomoNo = rmAccomoNo;
		this.accomoName = accomoName;
		this.ceoName = ceoName;
		this.accomoType = accomoType;
		this.registNo = registNo;
		this.address = address;
		this.adrDetail = adrDetail;
		this.email = email;
		this.homepage = homepage;
		this.facility = facility;
		this.accomoPath = accomoPath;
		this.near = near;
		this.rule = rule;
		this.parking = parking;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.peakStart = peakStart;
		this.peakEnd = peakEnd;
		this.ownerNo = ownerNo;
		this.approvalYN = approvalYN;
		this.rmType = rmType;
		this.enAccomoNO = enAccomoNO;
		this.thumbNailPath = thumbNailPath;
		this.approvalStatus = approvalStatus;
		this.insPectionComment = insPectionComment;
		this.accomoNo = accomoNo;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public int getRmAccomoNo() {
		return rmAccomoNo;
	}

	public void setRmAccomoNo(int rmAccomoNo) {
		this.rmAccomoNo = rmAccomoNo;
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

	public String getRegistNo() {
		return registNo;
	}

	public void setRegistNo(String registNo) {
		this.registNo = registNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAdrDetail() {
		return adrDetail;
	}

	public void setAdrDetail(String adrDetail) {
		this.adrDetail = adrDetail;
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

	public String getAccomoPath() {
		return accomoPath;
	}

	public void setAccomoPath(String accomoPath) {
		this.accomoPath = accomoPath;
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

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getApprovalYN() {
		return approvalYN;
	}

	public void setApprovalYN(String approvalYN) {
		this.approvalYN = approvalYN;
	}

	public String getRmType() {
		return rmType;
	}

	public void setRmType(String rmType) {
		this.rmType = rmType;
	}

	public int getEnAccomoNO() {
		return enAccomoNO;
	}

	public void setEnAccomoNO(int enAccomoNO) {
		this.enAccomoNO = enAccomoNO;
	}

	public String getThumbNailPath() {
		return thumbNailPath;
	}

	public void setThumbNailPath(String thumbNailPath) {
		this.thumbNailPath = thumbNailPath;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getInsPectionComment() {
		return insPectionComment;
	}

	public void setInsPectionComment(String insPectionComment) {
		this.insPectionComment = insPectionComment;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	@Override
	public String toString() {
		return "RmAccomoInfoDTO [requestNo=" + requestNo + ", rmAccomoNo=" + rmAccomoNo + ", accomoName=" + accomoName
				+ ", ceoName=" + ceoName + ", accomoType=" + accomoType + ", registNo=" + registNo + ", address="
				+ address + ", adrDetail=" + adrDetail + ", email=" + email + ", homepage=" + homepage + ", facility="
				+ facility + ", accomoPath=" + accomoPath + ", near=" + near + ", rule=" + rule + ", parking=" + parking
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", peakStart=" + peakStart + ", peakEnd="
				+ peakEnd + ", ownerNo=" + ownerNo + ", approvalYN=" + approvalYN + ", rmType=" + rmType
				+ ", enAccomoNO=" + enAccomoNO + ", thumbNailPath=" + thumbNailPath + ", approvalStatus="
				+ approvalStatus + ", insPectionComment=" + insPectionComment + ", accomoNo=" + accomoNo + "]";
	}

	

	

	
	
	

}
