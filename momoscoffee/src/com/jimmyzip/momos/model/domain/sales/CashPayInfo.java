package com.jimmyzip.momos.model.domain.sales;

import com.jimmyzip.momos.model.domain.admin.BankAcc;

public class CashPayInfo {
	private int cash_pay_info_id;
	private Payment payment;
	private BankAcc bankAcc;
	private String user_bankname;
	private String user_bank_acc;
	private String depositor;
	private boolean pay_confirm;
	public int getCash_pay_info_id() {
		return cash_pay_info_id;
	}
	public void setCash_pay_info_id(int cash_pay_info_id) {
		this.cash_pay_info_id = cash_pay_info_id;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public BankAcc getBankAcc() {
		return bankAcc;
	}
	public void setBankAcc(BankAcc bankAcc) {
		this.bankAcc = bankAcc;
	}
	public String getUser_bankname() {
		return user_bankname;
	}
	public void setUser_bankname(String user_bankname) {
		this.user_bankname = user_bankname;
	}
	public String getUser_bank_acc() {
		return user_bank_acc;
	}
	public void setUser_bank_acc(String user_bank_acc) {
		this.user_bank_acc = user_bank_acc;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public boolean isPay_confirm() {
		return pay_confirm;
	}
	public void setPay_confirm(boolean pay_confirm) {
		this.pay_confirm = pay_confirm;
	}
}
