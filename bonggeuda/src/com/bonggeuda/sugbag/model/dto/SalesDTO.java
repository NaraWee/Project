package com.bonggeuda.sugbag.model.dto;

import java.util.Date;

public class SalesDTO {

	private String accomoName;
	private Date month;
	private String roomName;
	private int bookCount;
	private int totalCount;
	private int sales;
	private int settlement;
	private int fee;
	private int rowNum;

	public SalesDTO() {
		super();
	}

	public SalesDTO(String accomoName, Date month, String roomName, int bookCount, int totalCount, int sales,
			int settlement, int fee, int rowNum) {
		super();
		this.accomoName = accomoName;
		this.month = month;
		this.roomName = roomName;
		this.bookCount = bookCount;
		this.totalCount = totalCount;
		this.sales = sales;
		this.settlement = settlement;
		this.fee = fee;
		this.rowNum = rowNum;
	}

	public String getAccomoName() {
		return accomoName;
	}

	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}

	public Date getMonth() {
		return month;
	}

	public void setMonth(Date month) {
		this.month = month;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getSettlement() {
		return settlement;
	}

	public void setSettlement(int settlement) {
		this.settlement = settlement;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	@Override
	public String toString() {
		return "SalesDTO [accomoName=" + accomoName + ", month=" + month + ", roomName=" + roomName + ", bookCount="
				+ bookCount + ", totalCount=" + totalCount + ", sales=" + sales + ", settlement=" + settlement
				+ ", fee=" + fee + ", rowNum=" + rowNum + "]";
	}

}
