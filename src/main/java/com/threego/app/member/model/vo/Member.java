package com.threego.app.member.model.vo;

import java.sql.Timestamp;

public class Member {

	private String name;
	private String memberId;
	private String password;
	private String email;
	private String phone;
	private MemberRole memberRole;
	private Timestamp enrollDate;
	private String address;
	
	
	public Member() {
		super();
	}


	public Member(String name, String memberId, String password, String email, String phone, MemberRole memberRole,
			Timestamp enrollDate, String address) {
		super();
		this.name = name;
		this.memberId = memberId;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.memberRole = memberRole;
		this.enrollDate = enrollDate;
		this.address = address;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public MemberRole getMemberRole() {
		return memberRole;
	}


	public void setMemberRole(MemberRole memberRole) {
		this.memberRole = memberRole;
	}


	public Timestamp getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	
	
	@Override
	public String toString() {
		return "Member [name=" + name + ", memberId=" + memberId + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", memberRole=" + memberRole + ", enrollDate=" + enrollDate + ", address="
				+ address + "]";
	}
	
	
	
	
	
	
	
}
