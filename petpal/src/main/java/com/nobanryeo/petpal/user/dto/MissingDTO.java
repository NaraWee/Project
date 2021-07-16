package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class MissingDTO {
	
	private int boardCode; //게시물코드
	private Date boardDate; //게시글 등록날짜
	private Date missingDate; //잃어버린날
	private String area; //잃어버린지역
	private String place; //잃어버린장소
	private String phone; //연락처
	private String breed; //품종
	private String gender; //성별
	private int age;
	private double weigth; //무게
	private String character; //특징
	private String request; //요청사항
	private String deleteYn; //삭제여부
	private int stateCode; //상태코드
	private int userCode; //유저코드
	private String dOc; //개or고양이
	private String color; //색상
	private String userNickname; //유저 닉네임(보드 호출용)
	
	public MissingDTO() {
		
	}

	public MissingDTO(int boardCode, Date boardDate, Date missingDate, String area, String place, String phone,
			String breed, String gender, int age, double weigth, String character, String request, String deleteYn,
			int stateCode, int userCode, String dOc, String color, String userNickname) {
		super();
		this.boardCode = boardCode;
		this.boardDate = boardDate;
		this.missingDate = missingDate;
		this.area = area;
		this.place = place;
		this.phone = phone;
		this.breed = breed;
		this.gender = gender;
		this.age = age;
		this.weigth = weigth;
		this.character = character;
		this.request = request;
		this.deleteYn = deleteYn;
		this.stateCode = stateCode;
		this.userCode = userCode;
		this.dOc = dOc;
		this.color = color;
		this.userNickname = userNickname;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public Date getMissingDate() {
		return missingDate;
	}

	public void setMissingDate(Date missingDate) {
		this.missingDate = missingDate;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getWeigth() {
		return weigth;
	}

	public void setWeigth(double weigth) {
		this.weigth = weigth;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getStateCode() {
		return stateCode;
	}

	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getdOc() {
		return dOc;
	}

	public void setdOc(String dOc) {
		this.dOc = dOc;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "MissingDTO [boardCode=" + boardCode + ", boardDate=" + boardDate + ", missingDate=" + missingDate
				+ ", area=" + area + ", place=" + place + ", phone=" + phone + ", breed=" + breed + ", gender=" + gender
				+ ", age=" + age + ", weigth=" + weigth + ", character=" + character + ", request=" + request
				+ ", deleteYn=" + deleteYn + ", stateCode=" + stateCode + ", userCode=" + userCode + ", dOc=" + dOc
				+ ", color=" + color + ", userNickname=" + userNickname + "]";
	}

	
}
