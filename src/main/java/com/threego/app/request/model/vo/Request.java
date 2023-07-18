package com.threego.app.request.model.vo;

import java.sql.Date;

public class Request {
	
	private int reqNo;
	private String reqWriter;
	private String reqLocationId;
	private String reqPost;
	private String reqAddress;
	private String reqPhoto;
	private String reqStatus;
	private Date reqDate;
	private String reqRider;
	private Date reqCpDate;
	
	
	public Request() {
		// TODO Auto-generated constructor stub
	}

<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/semijo6/semi-project.git
	public Request(int reqNo, String reqWriter, String reqLocationId, String reqPost, String reqAddress,
			String reqPhoto, String reqStatus, Date reqDate, String reqRider, Date reqCpDate) {
		super();
		this.reqNo = reqNo;
		this.reqWriter = reqWriter;
		this.reqLocationId = reqLocationId;
		this.reqPost = reqPost;
		this.reqAddress = reqAddress;
		this.reqPhoto = reqPhoto;
		this.reqStatus = reqStatus;
		this.reqDate = reqDate;
		this.reqRider = reqRider;
		this.reqCpDate = reqCpDate;
	}


	public int getReqNo() {
		return reqNo;
	}


	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}


	public String getReqWriter() {
		return reqWriter;
	}


	public void setReqWriter(String reqWriter) {
		this.reqWriter = reqWriter;
	}


	public String getReqLocationId() {
		return reqLocationId;
	}


	public void setReqLocationId(String reqLocationId) {
		this.reqLocationId = reqLocationId;
	}

<<<<<<< HEAD
	public String getReqPost() {
		return reqPost;
	}

	public void setReqPost(String reqPost) {
		this.reqPost = reqPost;
	}

	public String getReqAddress() {
		return reqAddress;
	}

	public void setReqAddress(String reqAddress) {
		this.reqAddress = reqAddress;
	}
=======

	public String getReqPost() {
		return reqPost;
	}


	public void setReqPost(String reqPost) {
		this.reqPost = reqPost;
	}


	public String getReqAddress() {
		return reqAddress;
	}


	public void setReqAddress(String reqAddress) {
		this.reqAddress = reqAddress;
	}

>>>>>>> branch 'master' of https://github.com/semijo6/semi-project.git

	public String getReqPhoto() {
		return reqPhoto;
	}


	public void setReqPhoto(String reqPhoto) {
		this.reqPhoto = reqPhoto;
	}


	public String getReqStatus() {
		return reqStatus;
	}


	public void setReqStatus(String reqStatus) {
		this.reqStatus = reqStatus;
	}


	public Date getReqDate() {
		return reqDate;
	}


	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}


	public String getReqRider() {
		return reqRider;
	}


	public void setReqRider(String reqRider) {
		this.reqRider = reqRider;
	}


	public Date getReqCpDate() {
		return reqCpDate;
	}


	public void setReqCpDate(Date reqCpDate) {
		this.reqCpDate = reqCpDate;
	}


	@Override
	public String toString() {
		return "Request [reqNo=" + reqNo + ", reqWriter=" + reqWriter + ", reqLocationId=" + reqLocationId
				+ ", reqPost=" + reqPost + ", reqAddress=" + reqAddress + ", reqPhoto=" + reqPhoto + ", reqStatus="
				+ reqStatus + ", reqDate=" + reqDate + ", reqRider=" + reqRider + ", reqCpDate=" + reqCpDate + "]";
	}
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/semijo6/semi-project.git

	
}
