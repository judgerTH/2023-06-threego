package com.threego.app.member.model.vo;

import java.sql.Date;


public class Member {

	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private MemberRole memberRole;
	private String post;
	private String address;
	private Date regDate;

	
	public Member() {
		
	}


	public Member(String id, String pwd, String name, String email, String phone, MemberRole memberRole, String post,
			String address, Date regDate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.memberRole = memberRole;
		this.post = post;
		this.address = address;
		this.regDate = regDate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", memberRole=" + memberRole + ", post=" + post + ", address=" + address + ", regDate=" + regDate
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
}
