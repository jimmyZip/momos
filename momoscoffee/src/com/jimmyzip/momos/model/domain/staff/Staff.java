package com.jimmyzip.momos.model.domain.staff;

import com.jimmyzip.momos.model.domain.member.Auth;

public class Staff {
	private int staff_id;
	private Auth auth;
	private Otherjob otherjob;
	private Career career;
	private String staff_name;
	private String position;
	private String staff_img;//스태프 이미지 주소
	
	//getter and setter
	public int getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}
	public Auth getAuth() {
		return auth;
	}
	public void setAuth(Auth auth) {
		this.auth = auth;
	}
	public Otherjob getOtherjob() {
		return otherjob;
	}
	public void setOtherjob(Otherjob otherjob) {
		this.otherjob = otherjob;
	}
	public Career getCareer() {
		return career;
	}
	public void setCareer(Career career) {
		this.career = career;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getStaff_img() {
		return staff_img;
	}
	public void setStaff_img(String staff_img) {
		this.staff_img = staff_img;
	}
}
