package com.bonggeuda.sugbag.model.dto;

public class RequestTaxBillDTO {

	private int requestNo;
	private String requestDate;
	private int accomoNo;
	private String responseYn;
	private int stlNo;
	private String accomoName;
	private int rowNum;

	public RequestTaxBillDTO() {
	}

	public RequestTaxBillDTO(int requestNo, String requestDate, int accomoNo, String responseYn, int stlNo,
			String accomoName, int rowNum) {
		super();
		this.requestNo = requestNo;
		this.requestDate = requestDate;
		this.accomoNo = accomoNo;
		this.responseYn = responseYn;
		this.stlNo = stlNo;
		this.accomoName = accomoName;
		this.rowNum = rowNum;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	public String getResponseYn() {
		return responseYn;
	}

	public void setResponseYn(String responseYn) {
		this.responseYn = responseYn;
	}

	public int getStlNo() {
		return stlNo;
	}

	public void setStlNo(int stlNo) {
		this.stlNo = stlNo;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	@Override
	public String toString() {
		return "RequestTaxBillDTO [requestNo=" + requestNo + ", requestDate=" + requestDate + ", accomoNo=" + accomoNo
				+ ", responseYn=" + responseYn + ", stlNo=" + stlNo + ", accomoName=" + accomoName + ", rowNum="
				+ rowNum + "]";
	}

}
