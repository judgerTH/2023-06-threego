package com.threego.app.member.model.vo;

import java.sql.Date;

public class Payment {

	private int pNO;
	private String pMemId;
	private String pTicId;
	private Date pDate;
	private int pCnt;
	private int pUseCnt;
	
	
	public Payment() {
		super();
	}


	public Payment(int pNO, String pMemId, String pTicId, Date pDate, int pCnt, int pUseCnt) {
		super();
		this.pNO = pNO;
		this.pMemId = pMemId;
		this.pTicId = pTicId;
		this.pDate = pDate;
		this.pCnt = pCnt;
		this.pUseCnt = pUseCnt;
	}


	public int getpNO() {
		return pNO;
	}


	public void setpNO(int pNO) {
		this.pNO = pNO;
	}


	public String getpMemId() {
		return pMemId;
	}


	public void setpMemId(String pMemId) {
		this.pMemId = pMemId;
	}


	public String getpTicId() {
		return pTicId;
	}


	public void setpTicId(String pTicId) {
		this.pTicId = pTicId;
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


	public int getpUseCnt() {
		return pUseCnt;
	}


	public void setpUseCnt(int pUseCnt) {
		this.pUseCnt = pUseCnt;
	}


	@Override
	public String toString() {
		return "Payment [pNO=" + pNO + ", pMemId=" + pMemId + ", pTicId=" + pTicId + ", pDate=" + pDate + ", pCnt="
				+ pCnt + ", pUseCnt=" + pUseCnt + "]";
	}
	
	
	
		
}



 
  