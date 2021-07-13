package com.tuna.can.model.dto;

public class UserInventoryDTO {

	private int userNo;
	private int itemNo;
	private int itemCategory;
	private String equipItemYN;
	private String itemName;
	private String itemImg;
	
	public UserInventoryDTO() {

	}

	public UserInventoryDTO(int userNo, int itemNo, int itemCategory, String equipItemYN, String itemName,
			String itemImg) {
		this.userNo = userNo;
		this.itemNo = itemNo;
		this.itemCategory = itemCategory;
		this.equipItemYN = equipItemYN;
		this.itemName = itemName;
		this.itemImg = itemImg;
	}

	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	public String getEquipItemYN() {
		return equipItemYN;
	}

	public void setEquipItemYN(String equipItemYN) {
		this.equipItemYN = equipItemYN;
	}
	@Override
	public String toString() {
		return "UserInventoryDTO [userNo=" + userNo + ", itemNo=" + itemNo + ", itemCategory=" + itemCategory
				+ ", equipItemYN=" + equipItemYN + ", itemName=" + itemName + ", itemImg=" + itemImg + "]";
	}

	
}
