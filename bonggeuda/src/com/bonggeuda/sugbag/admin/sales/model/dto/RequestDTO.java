package com.bonggeuda.sugbag.admin.sales.model.dto;

import java.sql.Date;

public class RequestDTO {

	private int requestNo;
	private Date requestDate;
	private int accomoNo;
	private String stlYn;
	private int stlNo;
	private Date stlDate;
	private String accomoName;
	


	public RequestDTO() {
		// TODO Auto-generated constructor stub
	}



	public RequestDTO(int requestNo, Date requestDate, int accomoNo, String stlYn, int stlNo, Date stlDate,
			String accomoName) {
		super();
		this.requestNo = requestNo;
		this.requestDate = requestDate;
		this.accomoNo = accomoNo;
		this.stlYn = stlYn;
		this.stlNo = stlNo;
		this.stlDate = stlDate;
		this.accomoName = accomoName;
	}



	public int getRequestNo() {
		return requestNo;
	}



	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}



	public Date getRequestDate() {
		return requestDate;
	}



	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}



	public int getAccomoNo() {
		return accomoNo;
	}



	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}



	public String getStlYn() {
		return stlYn;
	}



	public void setStlYn(String stlYn) {
		this.stlYn = stlYn;
	}



	public int getStlNo() {
		return stlNo;
	}



	public void setStlNo(int stlNo) {
		this.stlNo = stlNo;
	}



	public Date getStlDate() {
		return stlDate;
	}



	public void setStlDate(Date stlDate) {
		this.stlDate = stlDate;
	}



	public String getAccomoName() {
		return accomoName;
	}



	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}



	@Override
	public String toString() {
		return "RequestDTO [requestNo=" + requestNo + ", requestDate=" + requestDate + ", accomoNo=" + accomoNo
				+ ", stlYn=" + stlYn + ", stlNo=" + stlNo + ", stlDate=" + stlDate + ", accomoName=" + accomoName + "]";
	}
	
	
	
	
	
	
}
