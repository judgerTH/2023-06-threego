package com.threego.app.ticket.model.vo;

public class Ticket {
	private String tic_id;
	private String tic_name;
	private int tic_cnt;
	private int tic_price;
	
	public Ticket() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ticket(String tic_id, String tic_name, int tic_cnt, int tic_price) {
		super();
		this.tic_id = tic_id;
		this.tic_name = tic_name;
		this.tic_cnt = tic_cnt;
		this.tic_price = tic_price;
	}

	public String getTic_id() {
		return tic_id;
	}

	public void setTic_id(String tic_id) {
		this.tic_id = tic_id;
	}

	public String getTic_name() {
		return tic_name;
	}

	public void setTic_name(String tic_name) {
		this.tic_name = tic_name;
	}

	public int getTic_cnt() {
		return tic_cnt;
	}

	public void setTic_cnt(int tic_cnt) {
		this.tic_cnt = tic_cnt;
	}

	public int getTic_price() {
		return tic_price;
	}

	public void setTic_price(int tic_price) {
		this.tic_price = tic_price;
	}

	@Override
	public String toString() {
		return "Ticket [tic_id=" + tic_id + ", tic_name=" + tic_name + ", tic_cnt=" + tic_cnt + ", tic_price="
				+ tic_price + "]";
	}
	
	
}
