package com.tuna.can.model.dto;

public class AddFriendDTO {

	private int userNo;
	private int requsetFriendNo;
	private String requestFriendNickName;
	
	
	public AddFriendDTO() {
		super();
	}


	public AddFriendDTO(int userNo, int requsetFriendNo ,String requestFriendNickName) {
		super();
		this.userNo = userNo;
		this.requsetFriendNo = requsetFriendNo;
		this.requestFriendNickName = requestFriendNickName;
	}


	public String getRequestFriendNickName() {
		return requestFriendNickName;
	}


	public void setRequestFriendNickName(String requestFriendNickName) {
		this.requestFriendNickName = requestFriendNickName;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getRequsetFriendNo() {
		return requsetFriendNo;
	}


	public void setRequsetFriendNo(int requsetFriendNo) {
		this.requsetFriendNo = requsetFriendNo;
	}


	@Override
	public String toString() {
		return "AddFriendDTO [userNo=" + userNo + ", requsetFriendNo=" + requsetFriendNo + "]";
	}
	
	
	
	
}
