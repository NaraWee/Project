package com.bonggeuda.sugbag.admin.sales.model.dto;

import java.sql.Date;

public class StlPerDTO {

	private int salesNo;
	private int accomoNo;
	private int roomNo;
	private Date saleDate;
	private int salePrice;
	private int fee;
	private int paymentNo;
	private int taxPrice;
	private int preTaxPrice;
	private int supplyPrice;
	private String stlYn;
	private String roomName;
	private String accomoName;
	private int finalStlPrice;
	
	private Date stlDate;


	public StlPerDTO() {
		// TODO Auto-generated constructor stub
	}


	public StlPerDTO(int salesNo, int accomoNo, int roomNo, Date saleDate, int salePrice, int fee, int paymentNo,
			int taxPrice, int preTaxPrice, int supplyPrice, String stlYn, String roomName, String accomoName,
			int finalStlPrice, Date stlDate) {
		super();
		this.salesNo = salesNo;
		this.accomoNo = accomoNo;
		this.roomNo = roomNo;
		this.saleDate = saleDate;
		this.salePrice = salePrice;
		this.fee = fee;
		this.paymentNo = paymentNo;
		this.taxPrice = taxPrice;
		this.preTaxPrice = preTaxPrice;
		this.supplyPrice = supplyPrice;
		this.stlYn = stlYn;
		this.roomName = roomName;
		this.accomoName = accomoName;
		this.finalStlPrice = finalStlPrice;
		this.stlDate = stlDate;
	}


	public int getSalesNo() {
		return salesNo;
	}


	public void setSalesNo(int salesNo) {
		this.salesNo = salesNo;
	}


	public int getAccomoNo() {
		return accomoNo;
	}


	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public Date getSaleDate() {
		return saleDate;
	}


	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}


	public int getSalePrice() {
		return salePrice;
	}


	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}


	public int getFee() {
		return fee;
	}


	public void setFee(int fee) {
		this.fee = fee;
	}


	public int getPaymentNo() {
		return paymentNo;
	}


	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}


	public int getTaxPrice() {
		return taxPrice;
	}


	public void setTaxPrice(int taxPrice) {
		this.taxPrice = taxPrice;
	}


	public int getPreTaxPrice() {
		return preTaxPrice;
	}


	public void setPreTaxPrice(int preTaxPrice) {
		this.preTaxPrice = preTaxPrice;
	}


	public int getSupplyPrice() {
		return supplyPrice;
	}


	public void setSupplyPrice(int supplyPrice) {
		this.supplyPrice = supplyPrice;
	}


	public String getStlYn() {
		return stlYn;
	}


	public void setStlYn(String stlYn) {
		this.stlYn = stlYn;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	public String getAccomoName() {
		return accomoName;
	}


	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}


	public int getFinalStlPrice() {
		return finalStlPrice;
	}


	public void setFinalStlPrice(int finalStlPrice) {
		this.finalStlPrice = finalStlPrice;
	}


	public Date getStlDate() {
		return stlDate;
	}


	public void setStlDate(Date stlDate) {
		this.stlDate = stlDate;
	}


	@Override
	public String toString() {
		return "StlPerDTO [salesNo=" + salesNo + ", accomoNo=" + accomoNo + ", roomNo=" + roomNo + ", saleDate="
				+ saleDate + ", salePrice=" + salePrice + ", fee=" + fee + ", paymentNo=" + paymentNo + ", taxPrice="
				+ taxPrice + ", preTaxPrice=" + preTaxPrice + ", supplyPrice=" + supplyPrice + ", stlYn=" + stlYn
				+ ", roomName=" + roomName + ", accomoName=" + accomoName + ", finalStlPrice=" + finalStlPrice
				+ ", stlDate=" + stlDate + "]";
	}
	
	

	

	
	
}
