package com.jimmyzip.momos.model.domain.sales;

public class Coupon {//coupon 종류, admin view에서 설정(입력)하도록
	private int coupon_id;
	private int discount_rate;//할인율
	private int valid_term;//유효기간
	
	//getter and setter
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public int getValid_term() {
		return valid_term;
	}
	public void setValid_term(int valid_term) {
		this.valid_term = valid_term;
	}
}
