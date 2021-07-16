package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class AdDTO {
	
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
	private int userCode;
	private int adTypeCode;
	private String adTitle;
	private String payMethod;
	private int decisionCode;
	private Date cancelApplyDate;
	private Date postStartDate;
	private Date postEndDate;
	private int stateCode;
	private Date clickDate;
	private String adTypeName;
	private int adPrice;
	private int adWeek;
	private int clickCount;
	private int morePayAmount;
	private String leaderName;
	private String companyLocation;
	private String industry;
	private String industryDetail;
	private String pictureName;
	private String pictureUrl;
	private Date pictureUploadDate;
	private String pictureDeleteYn;
	private String pictureNewName;
	private String pictureUtilPath;
	private Date decisionDate;
	private int nowPage; 	//현재 페이지
	private int startPage;	//시작페이지
	private int endPage;	//끝페이지
	private int total;		//게시글 총 갯수
	private int cntPerPage;	//페이지당 글 갯수
	private int lastPage;	//마지막페이지
	private int start;		//쿼리에 쓸 start
	private int end;		//쿼리에 쓸 end
	private Date sysdate;
	
	private int cntPage = 5;

	public AdDTO() {}
	
	public AdDTO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	public AdDTO(int adCode, String companyName, Date applyDate, String companyNumber, String companyPhone,
			String companyEmail, String adContent, String postYn, String refundYn, Date payDate2nd, int pictureCode,
			Date payDate1st, int userCode, int adTypeCode, String adTitle, String payMethod, int decisionCode,
			Date cancelApplyDate, Date postStartDate, Date postEndDate, int stateCode, Date clickDate,
			String adTypeName, int adPrice, int adWeek, int clickCount, int morePayAmount, String leaderName,
			String companyLocation, String industry, String industryDetail, String pictureName, String pictureUrl,
			Date pictureUploadDate, String pictureDeleteYn, String pictureNewName, String pictureUtilPath,
			Date decisionDate, int nowPage, int startPage, int endPage, int total, int cntPerPage, int lastPage,
			int start, int end, int cntPage) {
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
		this.userCode = userCode;
		this.adTypeCode = adTypeCode;
		this.adTitle = adTitle;
		this.payMethod = payMethod;
		this.decisionCode = decisionCode;
		this.cancelApplyDate = cancelApplyDate;
		this.postStartDate = postStartDate;
		this.postEndDate = postEndDate;
		this.stateCode = stateCode;
		this.clickDate = clickDate;
		this.adTypeName = adTypeName;
		this.adPrice = adPrice;
		this.adWeek = adWeek;
		this.clickCount = clickCount;
		this.morePayAmount = morePayAmount;
		this.leaderName = leaderName;
		this.companyLocation = companyLocation;
		this.industry = industry;
		this.industryDetail = industryDetail;
		this.pictureName = pictureName;
		this.pictureUrl = pictureUrl;
		this.pictureUploadDate = pictureUploadDate;
		this.pictureDeleteYn = pictureDeleteYn;
		this.pictureNewName = pictureNewName;
		this.pictureUtilPath = pictureUtilPath;
		this.decisionDate = decisionDate;
		this.nowPage = nowPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.total = total;
		this.cntPerPage = cntPerPage;
		this.lastPage = lastPage;
		this.start = start;
		this.end = end;
		this.cntPage = cntPage;
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

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
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

	public Date getClickDate() {
		return clickDate;
	}

	public void setClickDate(Date clickDate) {
		this.clickDate = clickDate;
	}

	public String getAdTypeName() {
		return adTypeName;
	}

	public void setAdTypeName(String adTypeName) {
		this.adTypeName = adTypeName;
	}

	public int getAdPrice() {
		return adPrice;
	}

	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}

	public int getAdWeek() {
		return adWeek;
	}

	public void setAdWeek(int adWeek) {
		this.adWeek = adWeek;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public int getMorePayAmount() {
		return morePayAmount;
	}

	public void setMorePayAmount(int morePayAmount) {
		this.morePayAmount = morePayAmount;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
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

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public Date getPictureUploadDate() {
		return pictureUploadDate;
	}

	public void setPictureUploadDate(Date pictureUploadDate) {
		this.pictureUploadDate = pictureUploadDate;
	}

	public String getPictureDeleteYn() {
		return pictureDeleteYn;
	}

	public void setPictureDeleteYn(String pictureDeleteYn) {
		this.pictureDeleteYn = pictureDeleteYn;
	}

	public String getPictureNewName() {
		return pictureNewName;
	}

	public void setPictureNewName(String pictureNewName) {
		this.pictureNewName = pictureNewName;
	}

	public String getPictureUtilPath() {
		return pictureUtilPath;
	}

	public void setPictureUtilPath(String pictureUtilPath) {
		this.pictureUtilPath = pictureUtilPath;
	}

	public Date getDecisionDate() {
		return decisionDate;
	}

	public void setDecisionDate(Date decisionDate) {
		this.decisionDate = decisionDate;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

	@Override
	public String toString() {
		return "AdDTO [adCode=" + adCode + ", companyName=" + companyName + ", applyDate=" + applyDate
				+ ", companyNumber=" + companyNumber + ", companyPhone=" + companyPhone + ", companyEmail="
				+ companyEmail + ", adContent=" + adContent + ", postYn=" + postYn + ", refundYn=" + refundYn
				+ ", payDate2nd=" + payDate2nd + ", pictureCode=" + pictureCode + ", payDate1st=" + payDate1st
				+ ", userCode=" + userCode + ", adTypeCode=" + adTypeCode + ", adTitle=" + adTitle + ", payMethod="
				+ payMethod + ", decisionCode=" + decisionCode + ", cancelApplyDate=" + cancelApplyDate
				+ ", postStartDate=" + postStartDate + ", postEndDate=" + postEndDate + ", stateCode=" + stateCode
				+ ", clickDate=" + clickDate + ", adTypeName=" + adTypeName + ", adPrice=" + adPrice + ", adWeek="
				+ adWeek + ", clickCount=" + clickCount + ", morePayAmount=" + morePayAmount + ", leaderName="
				+ leaderName + ", companyLocation=" + companyLocation + ", industry=" + industry + ", industryDetail="
				+ industryDetail + ", pictureName=" + pictureName + ", pictureUrl=" + pictureUrl
				+ ", pictureUploadDate=" + pictureUploadDate + ", pictureDeleteYn=" + pictureDeleteYn
				+ ", pictureNewName=" + pictureNewName + ", pictureUtilPath=" + pictureUtilPath + ", decisionDate="
				+ decisionDate + ", nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", total=" + total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start
				+ ", end=" + end + ", cntPage=" + cntPage + "]";
	}

}
