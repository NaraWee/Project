package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class PointHistoryDTO {

	private int paymentNo;
	private int historyNo;
	private String getuseType;
	private int point;
	private String pointPath;
	private Date guDate;
	private int pointNo;
	
	public PointHistoryDTO() {}

	public PointHistoryDTO(int paymentNo, int historyNo, String getuseType, int point, String pointPath, Date guDate,
			int pointNo) {
		super();
		this.paymentNo = paymentNo;
		this.historyNo = historyNo;
		this.getuseType = getuseType;
		this.point = point;
		this.pointPath = pointPath;
		this.guDate = guDate;
		this.pointNo = pointNo;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	public String getGetuseType() {
		return getuseType;
	}

	public void setGetuseType(String getuseType) {
		this.getuseType = getuseType;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPointPath() {
		return pointPath;
	}

	public void setPointPath(String pointPath) {
		this.pointPath = pointPath;
	}

	public Date getGuDate() {
		return guDate;
	}

	public void setGuDate(Date guDate) {
		this.guDate = guDate;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	@Override
	public String toString() {
		return "PointHistoryDTO [paymentNo=" + paymentNo + ", historyNo=" + historyNo + ", getuseType=" + getuseType
				+ ", point=" + point + ", pointPath=" + pointPath + ", guDate=" + guDate + ", pointNo=" + pointNo + "]";
	}
	
}
