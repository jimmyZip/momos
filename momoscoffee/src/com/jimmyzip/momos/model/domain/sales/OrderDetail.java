package com.jimmyzip.momos.model.domain.sales;

import com.jimmyzip.momos.model.domain.product.Product;

public class OrderDetail {
	private int order_detail_id;
	private OrderSummary orderSummary;
	private Product product;
	private int order_amount;
	
	//getter and setter
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public OrderSummary getOrderSummary() {
		return orderSummary;
	}
	public void setOrderSummary(OrderSummary orderSummary) {
		this.orderSummary = orderSummary;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
}
