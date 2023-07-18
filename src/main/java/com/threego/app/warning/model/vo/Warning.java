package com.threego.app.warning.model.vo;

import java.sql.Date;

public class Warning {

	int WarningNo; // 신고번호
	int WarningReqNo; // 요청테이블에서 넘어온 요청번호
	String WarningWriter; // 신고자(멤버테이블에서 넘어온 아이디)
	String WarningContent; // 신고내용
	Date WarningRegDate; // 신고 등록일
	int WarningConfirm; // 신고 확인여부 - 0: 신고확인중, 1: 신고확인완료 
	String WarningCaution; // 주의조치
	private WarnigMemberRole memberRole;
	String requestWriter;
	String requestRider;
	
	public Warning() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Warning(int warningNo, int warningReqNo, String warningWriter, String warningContent, Date warningRegDate,
			int warningConfirm, String warningCaution, WarnigMemberRole memberRole) {
		super();
		WarningNo = warningNo;
		WarningReqNo = warningReqNo;
		WarningWriter = warningWriter;
		WarningContent = warningContent;
		WarningRegDate = warningRegDate;
		WarningConfirm = warningConfirm;
		WarningCaution = warningCaution;
		this.memberRole = memberRole;
	}

	public Warning(int warningNo, int warningReqNo, String warningWriter, String warningContent, Date warningRegDate,
			int warningConfirm, String warningCaution) {
		super();
		WarningNo = warningNo;
		WarningReqNo = warningReqNo;
		WarningWriter = warningWriter;
		WarningContent = warningContent;
		WarningRegDate = warningRegDate;
		WarningConfirm = warningConfirm;
		WarningCaution = warningCaution;
	}

		
	public Warning(int warningNo, int warningReqNo, String warningWriter, String warningContent, Date warningRegDate,
			int warningConfirm, String warningCaution, WarnigMemberRole memberRole, String requestWriter,
			String requestRider) {
		super();
		WarningNo = warningNo;
		WarningReqNo = warningReqNo;
		WarningWriter = warningWriter;
		WarningContent = warningContent;
		WarningRegDate = warningRegDate;
		WarningConfirm = warningConfirm;
		WarningCaution = warningCaution;
		this.memberRole = memberRole;
		this.requestWriter = requestWriter;
		this.requestRider = requestRider;
	}


	public int getWarningNo() {
		return WarningNo;
	}

	public void setWarningNo(int warningNo) {
		WarningNo = warningNo;
	}

	public int getWarningReqNo() {
		return WarningReqNo;
	}

	public void setWarningReqNo(int warningReqNo) {
		WarningReqNo = warningReqNo;
	}

	public String getWarningWriter() {
		return WarningWriter;
	}

	public void setWarningWriter(String warningWriter) {
		WarningWriter = warningWriter;
	}

	public String getWarningContent() {
		return WarningContent;
	}

	public void setWarningContent(String warningContent) {
		WarningContent = warningContent;
	}

	public Date getWarningRegDate() {
		return WarningRegDate;
	}

	public void setWarningRegDate(Date warningRegDate) {
		WarningRegDate = warningRegDate;
	}

	public int getWarningConfirm() {
		return WarningConfirm;
	}

	public void setWarningConfirm(int warningConfirm) {
		WarningConfirm = warningConfirm;
	}

	public String getWarningCaution() {
		return WarningCaution;
	}

	public void setWarningCaution(String warningCaution) {
		WarningCaution = warningCaution;
	}

	public WarnigMemberRole getMemberRole() {
		return memberRole;
	}
	
	public void setMemberRole(WarnigMemberRole memberRole) {
		this.memberRole = memberRole;
	}
	
	
	
	public String getRequestWriter() {
		return requestWriter;
	}


	public String getRequestRider() {
		return requestRider;
	}


	public void setRequestWriter(String requestWriter) {
		this.requestWriter = requestWriter;
	}


	public void setRequestRider(String requestRider) {
		this.requestRider = requestRider;
	}


	@Override
	public String toString() {
		return "WarningVO [WarningNo=" + WarningNo + ", WarningReqNo=" + WarningReqNo + ", WarningWriter="
				+ WarningWriter + ", WarningContent=" + WarningContent + ", WarningRegDate=" + WarningRegDate
				+ ", WarningConfirm=" + WarningConfirm + ", WarningCaution=" + WarningCaution + "]";
	}
	
	
	
	
}
