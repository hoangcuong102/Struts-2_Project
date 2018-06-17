package com.Entity;

import java.util.Date;

public class Order {
	private int orderID;
	private Date orderDate;
	private String customerID;
	private String payment;
	
	public Order() {
		
	}
	public Order(int orderID, Date orderDate, String customerID, String payment) {
		
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.customerID = customerID;
		this.payment = payment;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
}
