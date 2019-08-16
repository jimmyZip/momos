package com.jimmyzip.momos.model.domain.sales;

public class CouponExpire {
	private int coupon_exp_id;
	private CouponList couponList;
	private String expired_date;
	
	//getter and setter
	public int getCoupon_exp_id() {
		return coupon_exp_id;
	}
	public void setCoupon_exp_id(int coupon_exp_id) {
		this.coupon_exp_id = coupon_exp_id;
	}
	public CouponList getCouponList() {
		return couponList;
	}
	public void setCouponList(CouponList couponList) {
		this.couponList = couponList;
	}
	public String getExpired_date() {
		return expired_date;
	}
	public void setExpired_date(String expired_date) {
		this.expired_date = expired_date;
	}
}
