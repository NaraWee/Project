package com.bonggeuda.sugbag.model.dto;

public class BookHistoryDTO {
	
	private int bookNO;
	private String approveDate;
	private String yesNoCode;
	private String rejectCommnet;
	private int historyNo;
	
	public BookHistoryDTO() {}

	public BookHistoryDTO(int bookNO, String approveDate, String yesNoCode, String rejectCommnet, int historyNo) {
		super();
		this.bookNO = bookNO;
		this.approveDate = approveDate;
		this.yesNoCode = yesNoCode;
		this.rejectCommnet = rejectCommnet;
		this.historyNo = historyNo;
	}

	public int getBookNO() {
		return bookNO;
	}

	public void setBookNO(int bookNO) {
		this.bookNO = bookNO;
	}

	public String getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}

	public String getYesNoCode() {
		return yesNoCode;
	}

	public void setYesNoCode(String yesNoCode) {
		this.yesNoCode = yesNoCode;
	}

	public String getRejectCommnet() {
		return rejectCommnet;
	}

	public void setRejectCommnet(String rejectCommnet) {
		this.rejectCommnet = rejectCommnet;
	}

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	@Override
	public String toString() {
		return "BookHistoryDTO [bookNO=" + bookNO + ", approveDate=" + approveDate + ", yesNoCode=" + yesNoCode
				+ ", rejectCommnet=" + rejectCommnet + ", historyNo=" + historyNo + "]";
	}
	
	
	
	

}
