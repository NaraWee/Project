package com.nobanryeo.petpal.admin.dto;

import java.sql.Date;

import com.nobanryeo.petpal.user.dto.UserInfoDTO;

public class AdAdminDTO {

	private int adCode;
	private String companyName;
	private Date applyDate;
	private String companyNumber;
	private String companyPhone;
	private String companyEmail;
	private String adContent;
	private String postYn;
	private String refundYn;
	private Date payDate2nd;
	private int pictureCode;
	private Date payDate1st;
	private int decisionCode;
	private int userCode;
	private int adTypeCode;
	private String adTitle;
	private String payMethod;
	private Date cancelApplyDate;
	private Date postStartDate;
	private Date postEndDate;
	private int stateCode;
	private UserInfoDTO user;
	private DecisionDTO decision;
	private int clickNum;
	private int price2nd;
	private String companyLocation;
	private String industry;
	private String industryDetail;
	private String leaderName;
	
	// 청구일자 (DTO에만 존재함)
	private Date payUntilDate;
	// 청구일자 (DB에 존재하는 컬럼)
	private Date payDate;
	// 납부상태 (DTO에만 존재함)
	private String payStatus;
	// 납부상태 (DB에 존재하는 컬럼)
	private String payNewStatus;
	// 세금계산서 발행일
	private Date taxBillDate;
	// 세금액
	private int taxPrice;
	// 오늘 - 광고 만료일
	private int calEndDate;
	// 오늘 - 취소 신청일
	private int calApplyDate;
	
	
	public AdAdminDTO() {
		super();
	}

	

	public AdAdminDTO(int adCode, String companyName, Date applyDate, String companyNumber, String companyPhone,
			String companyEmail, String adContent, String postYn, String refundYn, Date payDate2nd, int pictureCode,
			Date payDate1st, int decisionCode, int userCode, int adTypeCode, String adTitle, String payMethod,
			Date cancelApplyDate, Date postStartDate, Date postEndDate, int stateCode, UserInfoDTO user,
			DecisionDTO decision, int clickNum, int price2nd, String companyLocation, String industry,
			String industryDetail, String leaderName, Date payUntilDate, Date payDate, String payStatus,
			String payNewStatus, Date taxBillDate, int taxPrice, int calEndDate, int calApplyDate) {
		super();
		this.adCode = adCode;
		this.companyName = companyName;
		this.applyDate = applyDate;
		this.companyNumber = companyNumber;
		this.companyPhone = companyPhone;
		this.companyEmail = companyEmail;
		this.adContent = adContent;
		this.postYn = postYn;
		this.refundYn = refundYn;
		this.payDate2nd = payDate2nd;
		this.pictureCode = pictureCode;
		this.payDate1st = payDate1st;
		this.decisionCode = decisionCode;
		this.userCode = userCode;
		this.adTypeCode = adTypeCode;
		this.adTitle = adTitle;
		this.payMethod = payMethod;
		this.cancelApplyDate = cancelApplyDate;
		this.postStartDate = postStartDate;
		this.postEndDate = postEndDate;
		this.stateCode = stateCode;
		this.user = user;
		this.decision = decision;
		this.clickNum = clickNum;
		this.price2nd = price2nd;
		this.companyLocation = companyLocation;
		this.industry = industry;
		this.industryDetail = industryDetail;
		this.leaderName = leaderName;
		this.payUntilDate = payUntilDate;
		this.payDate = payDate;
		this.payStatus = payStatus;
		this.payNewStatus = payNewStatus;
		this.taxBillDate = taxBillDate;
		this.taxPrice = taxPrice;
		this.calEndDate = calEndDate;
		this.calApplyDate = calApplyDate;
	}

	// db에 청구일자, 납부상태 업데이트
	public AdAdminDTO(Date payUntilDate, String payNewStatus, int adCode) {
		setPayUntilDate(payUntilDate);
		setPayNewStatus(payNewStatus);
		setAdCode(adCode);
	}
	
	
	public int getAdCode() {
		return adCode;
	}

	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getCompanyNumber() {
		return companyNumber;
	}

	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyEmail() {
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	public String getAdContent() {
		return adContent;
	}

	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}

	public String getPostYn() {
		return postYn;
	}

	public void setPostYn(String postYn) {
		this.postYn = postYn;
	}

	public String getRefundYn() {
		return refundYn;
	}

	public void setRefundYn(String refundYn) {
		this.refundYn = refundYn;
	}

	public Date getPayDate2nd() {
		return payDate2nd;
	}

	public void setPayDate2nd(Date payDate2nd) {
		this.payDate2nd = payDate2nd;
	}

	public int getPictureCode() {
		return pictureCode;
	}

	public void setPictureCode(int pictureCode) {
		this.pictureCode = pictureCode;
	}

	public Date getPayDate1st() {
		return payDate1st;
	}

	public void setPayDate1st(Date payDate1st) {
		this.payDate1st = payDate1st;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getAdTypeCode() {
		return adTypeCode;
	}

	public void setAdTypeCode(int adTypeCode) {
		this.adTypeCode = adTypeCode;
	}

	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public Date getCancelApplyDate() {
		return cancelApplyDate;
	}

	public void setCancelApplyDate(Date cancelApplyDate) {
		this.cancelApplyDate = cancelApplyDate;
	}

	public Date getPostStartDate() {
		return postStartDate;
	}

	public void setPostStartDate(Date postStartDate) {
		this.postStartDate = postStartDate;
	}

	public Date getPostEndDate() {
		return postEndDate;
	}

	public void setPostEndDate(Date postEndDate) {
		this.postEndDate = postEndDate;
	}

	public int getStateCode() {
		return stateCode;
	}

	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}

	public UserInfoDTO getUser() {
		return user;
	}

	public void setUser(UserInfoDTO user) {
		this.user = user;
	}

	public DecisionDTO getDecision() {
		return decision;
	}

	public void setDecision(DecisionDTO decision) {
		this.decision = decision;
	}

	public int getClickNum() {
		return clickNum;
	}

	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}

	public int getPrice2nd() {
		return price2nd;
	}

	public void setPrice2nd(int price2nd) {
		this.price2nd = price2nd;
	}

	public Date getPayUntilDate() {
		return payUntilDate;
	}

	public void setPayUntilDate(Date payUntilDate) {
		this.payUntilDate = payUntilDate;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public Date getTaxBillDate() {
		return taxBillDate;
	}

	public void setTaxBillDate(Date taxBillDate) {
		this.taxBillDate = taxBillDate;
	}

	public int getTaxPrice() {
		return taxPrice;
	}

	public void setTaxPrice(int taxPrice) {
		this.taxPrice = taxPrice;
	}

	public int getCalEndDate() {
		return calEndDate;
	}

	public void setCalEndDate(int calEndDate) {
		this.calEndDate = calEndDate;
	}

	public int getCalApplyDate() {
		return calApplyDate;
	}

	public void setCalApplyDate(int calApplyDate) {
		this.calApplyDate = calApplyDate;
	}

	public String getCompanyLocation() {
		return companyLocation;
	}

	public void setCompanyLocation(String companyLocation) {
		this.companyLocation = companyLocation;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getIndustryDetail() {
		return industryDetail;
	}

	public void setIndustryDetail(String industryDetail) {
		this.industryDetail = industryDetail;
	}


	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayNewStatus() {
		return payNewStatus;
	}

	public void setPayNewStatus(String payNewStatus) {
		this.payNewStatus = payNewStatus;
	}


	@Override
	public String toString() {
		return "AdAdminDTO [adCode=" + adCode + ", companyName=" + companyName + ", applyDate=" + applyDate
				+ ", companyNumber=" + companyNumber + ", companyPhone=" + companyPhone + ", companyEmail="
				+ companyEmail + ", adContent=" + adContent + ", postYn=" + postYn + ", refundYn=" + refundYn
				+ ", payDate2nd=" + payDate2nd + ", pictureCode=" + pictureCode + ", payDate1st=" + payDate1st
				+ ", decisionCode=" + decisionCode + ", userCode=" + userCode + ", adTypeCode=" + adTypeCode
				+ ", adTitle=" + adTitle + ", payMethod=" + payMethod + ", cancelApplyDate=" + cancelApplyDate
				+ ", postStartDate=" + postStartDate + ", postEndDate=" + postEndDate + ", stateCode=" + stateCode
				+ ", user=" + user + ", decision=" + decision + ", clickNum=" + clickNum + ", price2nd=" + price2nd
				+ ", companyLocation=" + companyLocation + ", industry=" + industry + ", industryDetail="
				+ industryDetail + ", leaderName=" + leaderName + ", payUntilDate=" + payUntilDate + ", payDate="
				+ payDate + ", payStatus=" + payStatus + ", payNewStatus=" + payNewStatus + ", taxBillDate="
				+ taxBillDate + ", taxPrice=" + taxPrice + ", calEndDate=" + calEndDate + ", calApplyDate="
				+ calApplyDate + "]";
	}


}
