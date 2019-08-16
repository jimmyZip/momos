package com.jimmyzip.momos.model.domain.branch;

import java.util.List;

public class Branch {
	private int branch_id;
	private String branch_name;
	private String branch_addr;
	private double lati;
	private double longi;
	private String message;//매장별 슬로건같은 메시지
	private String branch_tel;
	private String open_h;//여는시간
	private String close_h;//닫는시간
	private String last_order;//마지막주문접수시간
	private List<BranchImage> branchImage;
	
	//getter and setter
	public int getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_addr() {
		return branch_addr;
	}
	public void setBranch_addr(String branch_addr) {
		this.branch_addr = branch_addr;
	}
	public double getLati() {
		return lati;
	}
	public void setLati(double lati) {
		this.lati = lati;
	}
	public double getLongi() {
		return longi;
	}
	public void setLongi(double longi) {
		this.longi = longi;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getBranch_tel() {
		return branch_tel;
	}
	public void setBranch_tel(String branch_tel) {
		this.branch_tel = branch_tel;
	}
	public String getOpen_h() {
		return open_h;
	}
	public void setOpen_h(String open_h) {
		this.open_h = open_h;
	}
	public String getClose_h() {
		return close_h;
	}
	public void setClose_h(String close_h) {
		this.close_h = close_h;
	}
	public String getLast_order() {
		return last_order;
	}
	public void setLast_order(String last_order) {
		this.last_order = last_order;
	}
	public List<BranchImage> getBranchImage() {
		return branchImage;
	}
	public void setBranchImage(List<BranchImage> branchImage) {
		this.branchImage = branchImage;
	}
}
