package com.bonggeuda.sugbag.admin.sales.common;

public class SalesCalculator {

	public int getPrice(int price) {
		
		return price - (int)(price * 0.1);
	}
	
	public int getTax(int price) {
		
		return getPrice(price) / 11;
	}
	
	public int getSupplyPrice(int price) {
		
		return (getPrice(price) / 11) * 10;
	}
	
	public int getFee(int price) {
		return price/10;
	}
	
	public int getFinalStlPrice(int price) {
		
		return getSupplyPrice(price) - getTax(price);
	}
	
}
