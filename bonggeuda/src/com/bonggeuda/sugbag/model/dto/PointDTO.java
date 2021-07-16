package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class PointDTO {

	private int pointNo;
	private int userNo;
	private int point;
	
	public PointDTO() {}

	public PointDTO(int pointNo, int userNo, int point) {
		super();
		this.pointNo = pointNo;
		this.userNo = userNo;
		this.point = point;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "PointDTO [pointNo=" + pointNo + ", userNo=" + userNo + ", point=" + point + "]";
	}

}
