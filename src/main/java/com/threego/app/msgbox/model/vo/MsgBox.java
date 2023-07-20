package com.threego.app.msgbox.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MsgBox implements Serializable{

	private int msgNo;
	private MsgType msgType;
	private String msgSender;
	private String msgReceiver;
	private String msgContent;
	private Date msgSendingDate;
	private MsgConfirm msgConfirm;
	
	public MsgBox() {
		super();
	}

	public MsgBox(int msgNo, MsgType msgType, String msgSender, String msgReceiver, String msgContent, Date msgSendingDate) {
		super();
		this.msgNo = msgNo;
		this.msgType = msgType;
		this.msgSender = msgSender;
		this.msgReceiver = msgReceiver;
		this.msgContent = msgContent;
		this.msgSendingDate = msgSendingDate;
	}

		
	public MsgBox(int msgNo, MsgType msgType, String msgSender, String msgReceiver, String msgContent,
			Date msgSendingDate, MsgConfirm msgConfirm) {
		super();
		this.msgNo = msgNo;
		this.msgType = msgType;
		this.msgSender = msgSender;
		this.msgReceiver = msgReceiver;
		this.msgContent = msgContent;
		this.msgSendingDate = msgSendingDate;
		this.msgConfirm = msgConfirm;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public MsgType getMsgType() {
		return msgType;
	}

	public String getMsgSender() {
		return msgSender;
	}

	public String getMsgReceiver() {
		return msgReceiver;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public void setMsgType(MsgType msgType) {
		this.msgType = msgType;
	}

	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}

	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	
	
	public Date getMsgSendingDate() {
		return msgSendingDate;
	}

	public void setMsgSendingDate(Date msgSendingDate) {
		this.msgSendingDate = msgSendingDate;
	}

	
	
	public MsgConfirm getMsgConfirm() {
		return msgConfirm;
	}

	public void setMsgConfirm(MsgConfirm msgConfirm) {
		this.msgConfirm = msgConfirm;
	}

	@Override
	public String toString() {
		return "MsgBox [msgNo=" + msgNo + ", msgType=" + msgType + ", msgSender=" + msgSender + ", msgReceiver="
				+ msgReceiver + ", msgContent=" + msgContent + ", msgSendingDate=" + msgSendingDate + ", msgConfirm="
				+ msgConfirm + "]";
	}

	
	
	
}
