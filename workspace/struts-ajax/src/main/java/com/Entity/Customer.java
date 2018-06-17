package com.Entity;

public class Customer {
	private String customerID;
	private String customerName;
	
	public Customer() {
		
	}

	public Customer(String customerID, String customerName) {
		super();
		this.customerID = customerID;
		this.customerName = customerName;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
}
