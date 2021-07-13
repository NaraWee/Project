package com.bonggeuda.sugbag.user.dto;


public class UserReservationStatusDTO {
    
	private int bookNo;
	private String name;
	private String email;
    private int price;
    private int peopleCount;
    private String checkDate;
    private String checkOutDate;
   
	
    public UserReservationStatusDTO() {

	}


	public UserReservationStatusDTO(int bookNo, String name, String email, int price, int peopleCount, String checkDate,
			String checkOutDate) {
		super();
		this.bookNo = bookNo;
		this.name = name;
		this.email = email;
		this.price = price;
		this.peopleCount = peopleCount;
		this.checkDate = checkDate;
		this.checkOutDate = checkOutDate;
	}


	public int getBookNo() {
		return bookNo;
	}


	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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


	@Override
	public String toString() {
		return "UserReservationStatusDTO [bookNo=" + bookNo + ", name=" + name + ", email=" + email + ", price=" + price
				+ ", peopleCount=" + peopleCount + ", checkDate=" + checkDate + ", checkOutDate=" + checkOutDate + "]";
	}

	
	
    


    
	
	

	

	
}

	
    
    

