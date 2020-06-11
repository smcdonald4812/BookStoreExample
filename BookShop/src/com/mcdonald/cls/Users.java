package com.mcdonald.cls;

import java.util.Date;

public class Users {
	private int id;
	private boolean isSubscribed;
	private String nfirst, nlast, address, mobile, username, password, email;
	private Date regDate, accessed;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isSubscribed() {
		return isSubscribed;
	}
	public void setSubscribed(boolean isSubscribed) {
		this.isSubscribed = isSubscribed;
	}
	public String getNfirst() {
		return nfirst;
	}
	public void setNfirst(String nfirst) {
		this.nfirst = nfirst;
	}
	public String getNlast() {
		return nlast;
	}
	public void setNlast(String nlast) {
		this.nlast = nlast;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getAccessed() {
		return accessed;
	}
	public void setAccessed(Date accessed) {
		this.accessed = accessed;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
