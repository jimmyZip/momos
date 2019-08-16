package com.jimmyzip.momos.model.domain.member;

public class Members {
	private int member_id;
	private Auth auth;
	private String userid;
	private String userpass;
	private String username;
	private String usermail;
	private String userphone;
	private int post1;
	private int post2;
	private int post3;
	private String add1;
	private String add2;
	
	//getter and setter
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public Auth getAuth() {
		return auth;
	}
	public void setAuth(Auth auth) {
		this.auth = auth;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsermail() {
		return usermail;
	}
	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public int getPost1() {
		return post1;
	}
	public void setPost1(int post1) {
		this.post1 = post1;
	}
	public int getPost2() {
		return post2;
	}
	public void setPost2(int post2) {
		this.post2 = post2;
	}
	public int getPost3() {
		return post3;
	}
	public void setPost3(int post3) {
		this.post3 = post3;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
}
