package com.jimmyzip.momos.model.domain.staff;

public class Career {
	private int career_id;
	private Staff staff;
	private String career_year;
	private String career_month;
	private String career_desc;
	
	//getter and setter
	public int getCareer_id() {
		return career_id;
	}
	public void setCareer_id(int career_id) {
		this.career_id = career_id;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public String getCareer_year() {
		return career_year;
	}
	public void setCareer_year(String career_year) {
		this.career_year = career_year;
	}
	public String getCareer_month() {
		return career_month;
	}
	public void setCareer_month(String career_month) {
		this.career_month = career_month;
	}
	public String getCareer_desc() {
		return career_desc;
	}
	public void setCareer_desc(String career_desc) {
		this.career_desc = career_desc;
	}
}
