package com.bonggeuda.sugbag.admin.sales.model.dto;

import java.sql.Date;

public class TaxBillDTO {

	private int requestNo;
	private String accomoName;
	private String ceoName;
	private String accomoAddress;
	private String accomoType;
	private String registrationNo;
	private Date stlDate;
	private int count; 

	private int price;
	private int supplyPrice;
	private int tax;
	
	public TaxBillDTO() {
		// TODO Auto-generated constructor stub
	}

	public TaxBillDTO(int requestNo, String accomoName, String ceoName, String accomoAddress, String accomoType,
			String registrationNo, Date stlDate, int count, int price, int supplyPrice, int tax) {
		super();
		this.requestNo = requestNo;
		this.accomoName = accomoName;
		this.ceoName = ceoName;
		this.accomoAddress = accomoAddress;
		this.accomoType = accomoType;
		this.registrationNo = registrationNo;
		this.stlDate = stlDate;
		this.count = count;
		this.price = price;
		this.supplyPrice = supplyPrice;
		this.tax = tax;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
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

	public String getAccomoAddress() {
		return accomoAddress;
	}

	public void setAccomoAddress(String accomoAddress) {
		this.accomoAddress = accomoAddress;
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

	public Date getStlDate() {
		return stlDate;
	}

	public void setStlDate(Date stlDate) {
		this.stlDate = stlDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(int supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	@Override
	public String toString() {
		return "TaxBillDTO [requestNo=" + requestNo + ", accomoName=" + accomoName + ", ceoName=" + ceoName
				+ ", accomoAddress=" + accomoAddress + ", accomoType=" + accomoType + ", registrationNo="
				+ registrationNo + ", stlDate=" + stlDate + ", count=" + count + ", price=" + price + ", supplyPrice="
				+ supplyPrice + ", tax=" + tax + "]";
	}


	

	
	
	
}
