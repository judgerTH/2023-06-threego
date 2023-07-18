package com.threego.app.payment.model.vo;

import java.sql.Date;

public class PaymentDetail {

	private int pd_no;
	private String pd_mem_id;
	private String pd_tic_id;
	private int pd_tic_price;
	private Date pd_date;
	public PaymentDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentDetail(int pd_no, String pd_mem_id, String pd_tic_id, int pd_tic_price, Date pd_date) {
		super();
		this.pd_no = pd_no;
		this.pd_mem_id = pd_mem_id;
		this.pd_tic_id = pd_tic_id;
		this.pd_tic_price = pd_tic_price;
		this.pd_date = pd_date;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public String getPd_mem_id() {
		return pd_mem_id;
	}
	public void setPd_mem_id(String pd_mem_id) {
		this.pd_mem_id = pd_mem_id;
	}
	public String getPd_tic_id() {
		return pd_tic_id;
	}
	public void setPd_tic_id(String pd_tic_id) {
		this.pd_tic_id = pd_tic_id;
	}
	public int getPd_tic_price() {
		return pd_tic_price;
	}
	public void setPd_tic_price(int pd_tic_price) {
		this.pd_tic_price = pd_tic_price;
	}
	public Date getPd_date() {
		return pd_date;
	}
	public void setPd_date(Date pd_date) {
		this.pd_date = pd_date;
	}
	@Override
	public String toString() {
		return "PaymentDetail [pd_no=" + pd_no + ", pd_mem_id=" + pd_mem_id + ", pd_tic_id=" + pd_tic_id
				+ ", pd_tic_price=" + pd_tic_price + ", pd_date=" + pd_date + "]";
	}
	
	
}
