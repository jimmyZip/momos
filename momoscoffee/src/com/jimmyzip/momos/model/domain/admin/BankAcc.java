package com.jimmyzip.momos.model.domain.admin;

public class BankAcc {//무통장 입금 받을 계좌 관리
	private int bank_acc_id;
	private String bank_name;
	private String acc_num;
	
	//getter and setter
	public int getBank_acc_id() {
		return bank_acc_id;
	}
	public void setBank_acc_id(int bank_acc_id) {
		this.bank_acc_id = bank_acc_id;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
	}
}
