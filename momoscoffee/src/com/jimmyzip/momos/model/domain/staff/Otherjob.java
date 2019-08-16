package com.jimmyzip.momos.model.domain.staff;

public class Otherjob {
	private int otherjob_id;
	private Staff staff;
	private String job_desc;
	
	//getter and setter
	public int getOtherjob_id() {
		return otherjob_id;
	}
	public void setOtherjob_id(int otherjob_id) {
		this.otherjob_id = otherjob_id;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public String getJob_desc() {
		return job_desc;
	}
	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}
}
