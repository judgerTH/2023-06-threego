package com.threego.app.ticket.model.vo;

import java.sql.Date;

public class TicketPayment {
	private String ticName;
	private int ticPrice;
	private Date pDate;
	private int pCnt;
	public TicketPayment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TicketPayment(String ticName, int ticPrice, Date pDate, int pCnt) {
		super();
		this.ticName = ticName;
		this.ticPrice = ticPrice;
		this.pDate = pDate;
		this.pCnt = pCnt;
	}
	public String getTicName() {
		return ticName;
	}
	public void setTicName(String ticName) {
		this.ticName = ticName;
	}
	public int getTicPrice() {
		return ticPrice;
	}
	public void setTicPrice(int ticPrice) {
		this.ticPrice = ticPrice;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public int getpCnt() {
		return pCnt;
	}
	public void setpCnt(int pCnt) {
		this.pCnt = pCnt;
	}
	@Override
	public String toString() {
		return "TicketPayment [ticName=" + ticName + ", ticPrice=" + ticPrice + ", pDate=" + pDate + ", pCnt=" + pCnt
				+ "]";
	}
	
	
	
}
