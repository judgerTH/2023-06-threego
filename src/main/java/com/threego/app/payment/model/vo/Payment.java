package com.threego.app.payment.model.vo;

import java.sql.Date;

public class Payment {
	
	private int p_no;
	private String p_mem_id;
	private String p_tic_id;
	private Date p_date;
	private int p_cnt;
	private int p_use_cnt;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Payment(int p_no, String p_mem_id, String p_tic_id, Date p_date, int p_cnt, int p_use_cnt) {
		super();
		this.p_no = p_no;
		this.p_mem_id = p_mem_id;
		this.p_tic_id = p_tic_id;
		this.p_date = p_date;
		this.p_cnt = p_cnt;
		this.p_use_cnt = p_use_cnt;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_mem_id() {
		return p_mem_id;
	}

	public void setP_mem_id(String p_mem_id) {
		this.p_mem_id = p_mem_id;
	}

	public String getP_tic_id() {
		return p_tic_id;
	}

	public void setP_tic_id(String p_tic_id) {
		this.p_tic_id = p_tic_id;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getP_cnt() {
		return p_cnt;
	}

	public void setP_cnt(int p_cnt) {
		this.p_cnt = p_cnt;
	}

	public int getP_use_cnt() {
		return p_use_cnt;
	}

	public void setP_use_cnt(int p_use_cnt) {
		this.p_use_cnt = p_use_cnt;
	}

	@Override
	public String toString() {
		return "Payment [p_no=" + p_no + ", p_mem_id=" + p_mem_id + ", p_tic_id=" + p_tic_id + ", p_date=" + p_date
				+ ", p_cnt=" + p_cnt + ", p_use_cnt=" + p_use_cnt + "]";
	}
	
	
}
