package com.bonggeuda.sugbag.admin.sales.model.dto;

import java.sql.Date;

public class SettlementDTO {
	
	private int stlNo; // 정산 번호
	private Date stlDate; 
	private int monthAmount; // 월 판매액
	private int accomoNo; //숙소번호
	private int monthTaxPrice;
	private int monthFee;
	private int finalStlAmount; // 정산액 = 세금계산한것
	private int preTaxAmount; //세전 정산액
	private int supplyPrice;
	
	private String accomoName;
	private String ceoName;
	private String registrationNo;
	private String phone;
	

	public SettlementDTO() {
		// TODO Auto-generated constructor stub
	}


	public SettlementDTO(int stlNo, Date stlDate, int monthAmount, int accomoNo, int monthTaxPrice, int monthFee,
			int finalStlAmount, int preTaxAmount, int supplyPrice, String accomoName, String ceoName,
			String registrationNo, String phone) {
		super();
		this.stlNo = stlNo;
		this.stlDate = stlDate;
		this.monthAmount = monthAmount;
		this.accomoNo = accomoNo;
		this.monthTaxPrice = monthTaxPrice;
		this.monthFee = monthFee;
		this.finalStlAmount = finalStlAmount;
		this.preTaxAmount = preTaxAmount;
		this.supplyPrice = supplyPrice;
		this.accomoName = accomoName;
		this.ceoName = ceoName;
		this.registrationNo = registrationNo;
		this.phone = phone;
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


	public int getMonthAmount() {
		return monthAmount;
	}


	public void setMonthAmount(int monthAmount) {
		this.monthAmount = monthAmount;
	}


	public int getAccomoNo() {
		return accomoNo;
	}


	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}


	public int getMonthTaxPrice() {
		return monthTaxPrice;
	}


	public void setMonthTaxPrice(int monthTaxPrice) {
		this.monthTaxPrice = monthTaxPrice;
	}


	public int getMonthFee() {
		return monthFee;
	}


	public void setMonthFee(int monthFee) {
		this.monthFee = monthFee;
	}


	public int getFinalStlAmount() {
		return finalStlAmount;
	}


	public void setFinalStlAmount(int finalStlAmount) {
		this.finalStlAmount = finalStlAmount;
	}


	public int getPreTaxAmount() {
		return preTaxAmount;
	}


	public void setPreTaxAmount(int preTaxAmount) {
		this.preTaxAmount = preTaxAmount;
	}


	public int getSupplyPrice() {
		return supplyPrice;
	}


	public void setSupplyPrice(int supplyPrice) {
		this.supplyPrice = supplyPrice;
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


	public String getRegistrationNo() {
		return registrationNo;
	}


	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "SettlementDTO [stlNo=" + stlNo + ", stlDate=" + stlDate + ", monthAmount=" + monthAmount + ", accomoNo="
				+ accomoNo + ", monthTaxPrice=" + monthTaxPrice + ", monthFee=" + monthFee + ", finalStlAmount="
				+ finalStlAmount + ", preTaxAmount=" + preTaxAmount + ", supplyPrice=" + supplyPrice + ", accomoName="
				+ accomoName + ", ceoName=" + ceoName + ", registrationNo=" + registrationNo + ", phone=" + phone + "]";
	}


	
}
