package com.jimmyzip.momos.model.domain.product;

public class BeanMgmt {
	private int bean_mgmt_id;
	private String origin;//원두 원산지
	private String bean_name;//원두 품명
	private String bean_kind;//품종
	private String ipgo;//입고일
	private String bean_process;//가공방식
	private String packing_unit;//포장단위
	private String bean_desc;//원두 설명
	private int unit_price1;//bag 또는 box단위가
	private int unit_price2;//10kg가격
	
	//getter and setter
	public int getBean_mgmt_id() {
		return bean_mgmt_id;
	}
	public void setBean_mgmt_id(int bean_mgmt_id) {
		this.bean_mgmt_id = bean_mgmt_id;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getBean_name() {
		return bean_name;
	}
	public void setBean_name(String bean_name) {
		this.bean_name = bean_name;
	}
	public String getBean_kind() {
		return bean_kind;
	}
	public void setBean_kind(String bean_kind) {
		this.bean_kind = bean_kind;
	}
	public String getIpgo() {
		return ipgo;
	}
	public void setIpgo(String ipgo) {
		this.ipgo = ipgo;
	}
	public String getBean_process() {
		return bean_process;
	}
	public void setBean_process(String bean_process) {
		this.bean_process = bean_process;
	}
	public String getPacking_unit() {
		return packing_unit;
	}
	public void setPacking_unit(String packing_unit) {
		this.packing_unit = packing_unit;
	}
	public String getBean_desc() {
		return bean_desc;
	}
	public void setBean_desc(String bean_desc) {
		this.bean_desc = bean_desc;
	}
	public int getUnit_price1() {
		return unit_price1;
	}
	public void setUnit_price1(int unit_price1) {
		this.unit_price1 = unit_price1;
	}
	public int getUnit_price2() {
		return unit_price2;
	}
	public void setUnit_price2(int unit_price2) {
		this.unit_price2 = unit_price2;
	}
}
