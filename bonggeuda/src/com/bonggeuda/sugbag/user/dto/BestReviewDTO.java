package com.bonggeuda.sugbag.user.dto;

public class BestReviewDTO {
	
	private int rnum;
	private int reviewNo;
	private String title;
	private String userId;
	private int accomoNo;
	
	public BestReviewDTO() {
	
	}

	public BestReviewDTO(int rnum, int reviewNo, String title, String userId, int accomoNo) {
		super();
		this.rnum = rnum;
		this.reviewNo = reviewNo;
		this.title = title;
		this.userId = userId;
		this.accomoNo = accomoNo;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAccomoNo() {
		return accomoNo;
	}

	public void setAccomoNo(int accomoNo) {
		this.accomoNo = accomoNo;
	}

	@Override
	public String toString() {
		return "BestReviewDTO [rnum=" + rnum + ", reviewNo=" + reviewNo + ", title=" + title + ", userId=" + userId
				+ ", accomoNo=" + accomoNo + "]";
	}

	
	
}
