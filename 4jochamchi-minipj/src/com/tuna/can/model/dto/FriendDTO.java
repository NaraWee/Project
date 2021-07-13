
package com.tuna.can.model.dto;

public class FriendDTO {

	private String friendsNickname;
	private String image;
	private int UserNO;
	private int friendsNo;
	
	
	public FriendDTO() {
		super();
	}


	public FriendDTO(String friendsNickname, String image, int userNO, int friendsNo) {
		super();
		this.friendsNickname = friendsNickname;
		this.image = image;
		UserNO = userNO;
		this.friendsNo = friendsNo;
	}


	public String getFriendsNickname() {
		return friendsNickname;
	}


	public void setFriendsNickname(String friendsNickname) {
		this.friendsNickname = friendsNickname;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public int getUserNO() {
		return UserNO;
	}


	public void setUserNO(int userNO) {
		UserNO = userNO;
	}


	public int getFriendsNo() {
		return friendsNo;
	}


	public void setFriendsNo(int friendsNo) {
		this.friendsNo = friendsNo;
	}


	@Override
	public String toString() {
		return "FriendDTO [friendsNickname=" + friendsNickname + ", image=" + image + ", UserNO=" + UserNO
				+ ", friendsNo=" + friendsNo + "]";
	}
	
	
	
}
