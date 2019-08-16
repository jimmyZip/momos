package com.jimmyzip.momos.model.domain.sales;

public class CouponUse {
	private int coupon_use_id;
	private CouponList couponList;
	private Payment payment;
	private String coupon_use_date;
	
	//getter and setter
	public int getCoupon_use_id() {
		return coupon_use_id;
	}
	public void setCoupon_use_id(int coupon_use_id) {
		this.coupon_use_id = coupon_use_id;
	}
	public CouponList getCouponList() {
		return couponList;
	}
	public void setCouponList(CouponList couponList) {
		this.couponList = couponList;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public String getCoupon_use_date() {
		return coupon_use_date;
	}
	public void setCoupon_use_date(String coupon_use_date) {
		this.coupon_use_date = coupon_use_date;
	}
}
