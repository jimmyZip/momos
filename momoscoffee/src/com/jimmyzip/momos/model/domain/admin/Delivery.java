package com.jimmyzip.momos.model.domain.admin;

import com.jimmyzip.momos.model.domain.sales.OrderSummary;

public class Delivery {
	private int delivery_id;
	private OrderSummary orderSummary;
	private DeliStatus deliStatus;
	private String deli_num;//송장번호 또는 배송번호
	private String deli_name;//수취인명
	private String deli_phone;//수취인 연락처
	private String deli_add1;
	private String deli_add2;
	private int deli_post1;//배송지 우편번호
	private int deli_post2;
	private int deli_post3;
	private String deli_memo;//배송메모
	
	//getter setter
	public int getDelivery_id() {
		return delivery_id;
	}
	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}
	public OrderSummary getOrderSummary() {
		return orderSummary;
	}
	public void setOrderSummary(OrderSummary orderSummary) {
		this.orderSummary = orderSummary;
	}
	public DeliStatus getDeliStatus() {
		return deliStatus;
	}
	public void setDeliStatus(DeliStatus deliStatus) {
		this.deliStatus = deliStatus;
	}
	public String getDeli_num() {
		return deli_num;
	}
	public void setDeli_num(String deli_num) {
		this.deli_num = deli_num;
	}
	public String getDeli_name() {
		return deli_name;
	}
	public void setDeli_name(String deli_name) {
		this.deli_name = deli_name;
	}
	public String getDeli_phone() {
		return deli_phone;
	}
	public void setDeli_phone(String deli_phone) {
		this.deli_phone = deli_phone;
	}
	public String getDeli_add1() {
		return deli_add1;
	}
	public void setDeli_add1(String deli_add1) {
		this.deli_add1 = deli_add1;
	}
	public String getDeli_add2() {
		return deli_add2;
	}
	public void setDeli_add2(String deli_add2) {
		this.deli_add2 = deli_add2;
	}
	public int getDeli_post1() {
		return deli_post1;
	}
	public void setDeli_post1(int deli_post1) {
		this.deli_post1 = deli_post1;
	}
	public int getDeli_post2() {
		return deli_post2;
	}
	public void setDeli_post2(int deli_post2) {
		this.deli_post2 = deli_post2;
	}
	public int getDeli_post3() {
		return deli_post3;
	}
	public void setDeli_post3(int deli_post3) {
		this.deli_post3 = deli_post3;
	}
	public String getDeli_memo() {
		return deli_memo;
	}
	public void setDeli_memo(String deli_memo) {
		this.deli_memo = deli_memo;
	}
}
