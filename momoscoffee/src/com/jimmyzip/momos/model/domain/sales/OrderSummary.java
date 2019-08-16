package com.jimmyzip.momos.model.domain.sales;

import com.jimmyzip.momos.model.domain.member.Members;

public class OrderSummary {
	private int order_summary_id;
	private Members members;
	private int order_price;
	private String order_date;
	
	//getter and setter
	public int getOrder_summary_id() {
		return order_summary_id;
	}
	public void setOrder_summary_id(int order_summary_id) {
		this.order_summary_id = order_summary_id;
	}
	public Members getMembers() {
		return members;
	}
	public void setMembers(Members members) {
		this.members = members;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
}
