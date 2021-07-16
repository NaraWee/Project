package com.bonggeuda.sugbag.user.dto;

public class ReservationDetailDTO {
	
	 private String email; // 아이디
	 private String name; // 사용자이름
	 private String accomoName; //숙소명
	 private String roomName; // 방이름
	 private int price; // 예약가격
	 private int peopleCount; //인원수
	 private String checkDate; // 체크인 날짜
	 private String checkOutDate; // 체크아웃 날짜
	 private String reservationStatus;
	
	 
	public ReservationDetailDTO() {
		
	}


	public ReservationDetailDTO(String email, String name, String accomoName, String roomName, int price,
			int peopleCount, String checkDate, String checkOutDate, String reservationStatus) {
		super();
		this.email = email;
		this.name = name;
		this.accomoName = accomoName;
		this.roomName = roomName;
		this.price = price;
		this.peopleCount = peopleCount;
		this.checkDate = checkDate;
		this.checkOutDate = checkOutDate;
		this.reservationStatus = reservationStatus;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAccomoName() {
		return accomoName;
	}


	public void setAccomoName(String accomoName) {
		this.accomoName = accomoName;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getPeopleCount() {
		return peopleCount;
	}


	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}


	public String getCheckDate() {
		return checkDate;
	}


	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}


	public String getCheckOutDate() {
		return checkOutDate;
	}


	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}


	public String getReservationStatus() {
		return reservationStatus;
	}


	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}


	@Override
	public String toString() {
		return "ReservationDetailDTO [email=" + email + ", name=" + name + ", accomoName=" + accomoName + ", roomName="
				+ roomName + ", price=" + price + ", peopleCount=" + peopleCount + ", checkDate=" + checkDate
				+ ", checkOutDate=" + checkOutDate + ", reservationStatus=" + reservationStatus + "]";
	}


	
}
