package com.bonggeuda.sugbag.model.dto;

import java.sql.Date;

public class MemberDTO {

	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userPhone;
	private int reportCnt;
	private String nickName;
	private String withDrawYn;
	private String userRole;
	private Date signDate;
	private Date withDrawDate;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	public MemberDTO(int userNo, String userId, String userPwd, String userPhone, int reportCnt, String nickName,
			String withDrawYn, String userRole, Date signDate, Date withDrawDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userPhone = userPhone;
		this.reportCnt = reportCnt;
		this.nickName = nickName;
		this.withDrawYn = withDrawYn;
		this.userRole = userRole;
		this.signDate = signDate;
		this.withDrawDate = withDrawDate;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getWithDrawYn() {
		return withDrawYn;
	}
	public void setWithDrawYn(String withDrawYn) {
		this.withDrawYn = withDrawYn;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public Date getSignDate() {
		return signDate;
	}
	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}
	public Date getWithDrawDate() {
		return withDrawDate;
	}
	public void setWithDrawDate(Date withDrawDate) {
		this.withDrawDate = withDrawDate;
	}
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userPhone="
				+ userPhone + ", reportCnt=" + reportCnt + ", nickName=" + nickName + ", withDrawYn=" + withDrawYn
				+ ", userRole=" + userRole + ", signDate=" + signDate + ", withDrawDate=" + withDrawDate + "]";
	}
}
