package com.jimmyzip.momos.model.domain.branch;

import org.springframework.web.multipart.MultipartFile;

public class BranchImage {
	private int branch_image_id;
	private Branch branch;
	private String branch_img;
	private MultipartFile[] branchFile;
	private String[] deleteFile;

	//getter and setter
	public int getBranch_image_id() {
		return branch_image_id;
	}
	public void setBranch_image_id(int branch_image_id) {
		this.branch_image_id = branch_image_id;
	}
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	public String getBranch_img() {
		return branch_img;
	}
	public void setBranch_img(String branch_img) {
		this.branch_img = branch_img;
	}
	public MultipartFile[] getBranchFile() {
		return branchFile;
	}
	public void setBranchFile(MultipartFile[] branchFile) {
		this.branchFile = branchFile;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
}
