package com.bonggeuda.sugbag.user.dto;

import java.util.List;

public class UserInfoDTO {

	private int rnum; 
	private int userNo; //회원번호
	private String name; //닉네임
	private String email; // 아이디 
	private String password; // 비밀번호
	private String phoneNumber; // 휴대전화
	private int point; //포인트 
	private String detail;
	private int startPoint;
	private int reviewNo;
	private int upCount;
	
	public UserInfoDTO() {}

	public UserInfoDTO(int rnum, int userNo, String name, String email, String password, String phoneNumber, int point,
			String detail, int startPoint, int reviewNo, int upCount) {
		super();
		this.rnum = rnum;
		this.userNo = userNo;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.point = point;
		this.detail = detail;
		this.startPoint = startPoint;
		this.reviewNo = reviewNo;
		this.upCount = upCount;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(int startPoint) {
		this.startPoint = startPoint;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUpCount() {
		return upCount;
	}

	public void setUpCount(int upCount) {
		this.upCount = upCount;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [rnum=" + rnum + ", userNo=" + userNo + ", name=" + name + ", email=" + email
				+ ", password=" + password + ", phoneNumber=" + phoneNumber + ", point=" + point + ", detail=" + detail
				+ ", startPoint=" + startPoint + ", reviewNo=" + reviewNo + ", upCount=" + upCount + "]";
	}

	
}
