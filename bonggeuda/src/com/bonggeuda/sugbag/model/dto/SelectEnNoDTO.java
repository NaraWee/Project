package com.bonggeuda.sugbag.model.dto;

public class SelectEnNoDTO {

	private int EnNo;

	public SelectEnNoDTO() {
		super();
	}

	public SelectEnNoDTO(int enNo) {
		super();
		EnNo = enNo;
	}

	public int getEnNo() {
		return EnNo;
	}

	public void setEnNo(int enNo) {
		EnNo = enNo;
	}

	@Override
	public String toString() {
		return "SelectEnNoDTO [EnNo=" + EnNo + "]";
	}
	
	
}
