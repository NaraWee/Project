package com.bonggeuda.sugbag.admin.owner.model.dto;

import java.sql.Date;

public class OwnerInfoDTO {

	private int ownerNo;
	private String ownerId;
	private String ownerPwd;
	private String phone;
	private String ownerWithDrawYN;
	private Date signDate;
	private Date withDate;
	

//	OWNER_NO
//	OWNER_ID
//	OWNER_PWD
//	OWNER_PHONE
//	OWNER_WITHDRAW_YN
//	OWNER_SIGNDATE
//	OWNER_WITHDATE

	public OwnerInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public OwnerInfoDTO(int ownerNo, String ownerId, String ownerPwd, String phone, String ownerWithDrawYN,
			Date signDate, Date withDate) {
		super();
		this.ownerNo = ownerNo;
		this.ownerId = ownerId;
		this.ownerPwd = ownerPwd;
		this.phone = phone;
		this.ownerWithDrawYN = ownerWithDrawYN;
		this.signDate = signDate;
		this.withDate = withDate;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	public String getOwnerPwd() {
		return ownerPwd;
	}

	public void setOwnerPwd(String ownerPwd) {
		this.ownerPwd = ownerPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOwnerWithDrawYN() {
		return ownerWithDrawYN;
	}

	public void setOwnerWithDrawYN(String ownerWithDrawYN) {
		this.ownerWithDrawYN = ownerWithDrawYN;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public Date getWithDate() {
		return withDate;
	}

	public void setWithDate(Date withDate) {
		this.withDate = withDate;
	}

	@Override
	public String toString() {
		return "OwnerInfoDTO [ownerNo=" + ownerNo + ", ownerId=" + ownerId + ", ownerPwd=" + ownerPwd + ", phone="
				+ phone + ", ownerWithDrawYN=" + ownerWithDrawYN + ", signDate=" + signDate + ", withDate=" + withDate
				+ "]";
	}

}
