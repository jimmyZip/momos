package com.jimmyzip.momos.model.domain.product;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int product_id;
	private Subcategory subcategory;
	private String prod_name_kor;
	private String prod_name_eng;
	private int price;
	private String prod_desc;
	private int stock;
	private List<ProductImage> productImage;
	
	//getter and setter
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public Subcategory getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}
	public String getProd_name_kor() {
		return prod_name_kor;
	}
	public void setProd_name_kor(String prod_name_kor) {
		this.prod_name_kor = prod_name_kor;
	}
	public String getProd_name_eng() {
		return prod_name_eng;
	}
	public void setProd_name_eng(String prod_name_eng) {
		this.prod_name_eng = prod_name_eng;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProd_desc() {
		return prod_desc;
	}
	public void setProd_desc(String prod_desc) {
		this.prod_desc = prod_desc;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public List<ProductImage> getProductImage() {
		return productImage;
	}
	public void setProductImage(List<ProductImage> productImage) {
		this.productImage = productImage;
	}
}
