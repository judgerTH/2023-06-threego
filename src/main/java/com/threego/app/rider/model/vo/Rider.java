package com.threego.app.rider.model.vo;

import java.sql.Date;

public class Rider {
	
	private String riderId;
	private String riderLocationId;
	private String riderStatus;
	private Date riderRegDate;
	private Date riderUpDate;
	private String riderLocationName;
	private String riderName;
	private String fileName;
	
	public Rider() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Rider(String riderId, String riderLocationId, String riderStatus, Date riderRegDate, Date riderUpDate,
			String riderLocationName, String riderName, String fileName) {
		super();
		this.riderId = riderId;
		this.riderLocationId = riderLocationId;
		this.riderStatus = riderStatus;
		this.riderRegDate = riderRegDate;
		this.riderUpDate = riderUpDate;
		this.riderLocationName = riderLocationName;
		this.riderName = riderName;
		this.fileName = fileName;
	}

	public String getRiderId() {
		return riderId;
	}

	public void setRiderId(String riderId) {
		this.riderId = riderId;
	}

	public String getRiderLocationId() {
		return riderLocationId;
	}

	public void setRiderLocationId(String riderLocationId) {
		this.riderLocationId = riderLocationId;
	}

	public String getRiderStatus() {
		return riderStatus;
	}

	public void setRiderStatus(String riderStatus) {
		this.riderStatus = riderStatus;
	}

	public Date getRiderRegDate() {
		return riderRegDate;
	}

	public void setRiderRegDate(Date riderRegDate) {
		this.riderRegDate = riderRegDate;
	}

	public Date getRiderUpDate() {
		return riderUpDate;
	}

	public void setRiderUpDate(Date riderUpDate) {
		this.riderUpDate = riderUpDate;
	}

	public String getRiderLocationName() {
		return riderLocationName;
	}

	public void setRiderLocationName(String riderLocationName) {
		this.riderLocationName = riderLocationName;
	}

	public String getRiderName() {
		return riderName;
	}

	public void setRiderName(String riderName) {
		this.riderName = riderName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Rider [riderId=" + riderId + ", riderLocationId=" + riderLocationId + ", riderStatus=" + riderStatus
				+ ", riderRegDate=" + riderRegDate + ", riderUpDate=" + riderUpDate + ", riderLocationName="
				+ riderLocationName + ", riderName=" + riderName + ", fileName=" + fileName + "]";
	}

	
	
	
	
	
}
