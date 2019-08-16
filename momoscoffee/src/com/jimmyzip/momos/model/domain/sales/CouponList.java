package com.jimmyzip.momos.model.domain.sales;

import com.jimmyzip.momos.model.domain.member.Members;

public class CouponList {//issued_coupon_list
	private int coupon_list_id;
	private Coupon coupon;
	private Members members;
	private String coupon_num;
	private String issued_date;
	
	//getter and setter
	public int getCoupon_list_id() {
		return coupon_list_id;
	}
	public void setCoupon_list_id(int coupon_list_id) {
		this.coupon_list_id = coupon_list_id;
	}
	public Coupon getCoupon() {
		return coupon;
	}
	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}
	public Members getMembers() {
		return members;
	}
	public void setMembers(Members members) {
		this.members = members;
	}
	public String getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getIssued_date() {
		return issued_date;
	}
	public void setIssued_date(String issued_date) {
		this.issued_date = issued_date;
	}
}
