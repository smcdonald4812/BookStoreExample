package com.mcdonald.cls;

import java.util.Date;

public class PayOrder {
	private int id;
	private String userName, address, city, state, zip, nlast, nfirst;
	private float total;
	private Date purchaseDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getNlast() {
		return nlast;
	}
	public void setNlast(String nlast) {
		this.nlast = nlast;
	}
	public String getNfirst() {
		return nfirst;
	}
	public void setNfirst(String nfirst) {
		this.nfirst = nfirst;
	}
}
