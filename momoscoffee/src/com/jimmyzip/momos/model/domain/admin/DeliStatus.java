package com.jimmyzip.momos.model.domain.admin;

public class DeliStatus {//admin view에서 배송단계 명칭관리
	private int deli_status_id;
	private String deli_step;
	
	//getter and setter
	public int getDeli_status_id() {
		return deli_status_id;
	}
	public void setDeli_status_id(int deli_status_id) {
		this.deli_status_id = deli_status_id;
	}
	public String getDeli_step() {
		return deli_step;
	}
	public void setDeli_step(String deli_step) {
		this.deli_step = deli_step;
	}
}
