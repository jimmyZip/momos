package com.jimmyzip.momos.model.domain.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductImage {
	private int product_image_id;
	private Product product;
	private String prod_img;
	private MultipartFile[] myFile;
	private String[] deleteFile;
	
	//getter and setter
	public int getProduct_image_id() {
		return product_image_id;
	}
	public void setProduct_image_id(int product_image_id) {
		this.product_image_id = product_image_id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public MultipartFile[] getMyFile() {
		return myFile;
	}
	public void setMyFile(MultipartFile[] myFile) {
		this.myFile = myFile;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
}
