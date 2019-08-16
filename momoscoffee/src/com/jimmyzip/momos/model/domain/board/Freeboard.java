package com.jimmyzip.momos.model.domain.board;

import com.jimmyzip.momos.model.domain.member.Members;

public class Freeboard {
	private int board_id;
	private Members members;
	private String title;
	private String content;
	private String wdate;
	private String modidate;
	private String ip;
	private int hit;
	
	//getter and setter
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public Members getMembers() {
		return members;
	}
	public void setMembers(Members members) {
		this.members = members;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getModidate() {
		return modidate;
	}
	public void setModidate(String modidate) {
		this.modidate = modidate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
