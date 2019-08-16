package com.jimmyzip.momos.model.domain.product;

public class Subcategory {
	private int subcategory_id;
	private Topcategory topcategory;
	private String subcate_name;
	
	//getter and setter
	public int getSubcategory_id() {
		return subcategory_id;
	}
	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}
	public Topcategory getTopcategory() {
		return topcategory;
	}
	public void setTopcategory(Topcategory topcategory) {
		this.topcategory = topcategory;
	}
	public String getSubcate_name() {
		return subcate_name;
	}
	public void setSubcate_name(String subcate_name) {
		this.subcate_name = subcate_name;
	}
}
