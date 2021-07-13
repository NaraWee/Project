package com.tuna.can.model.dto;

public class StoreItemDTO {

	private int itemNo;
	private String itemName;
	private int itemPrice;
	private String itemImg;
	private int itemCategory;
	
	public StoreItemDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public StoreItemDTO(int itemNo, String itemName, int itemPrice, String itemImg, int itemCategory) {
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemImg = itemImg;
		this.itemCategory = itemCategory;
	}



	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}


	@Override
	public String toString() {
		return "StoreItemDTO [itemNo=" + itemNo + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", itemImg="
				+ itemImg + ", itemCategory=" + itemCategory + "]";
	}
	
	
}
