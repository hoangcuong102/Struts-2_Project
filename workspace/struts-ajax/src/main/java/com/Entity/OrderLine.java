package com.Entity;

public class OrderLine {
	private int orderID;
	private int productID;
	private int quantity;
	private double unitprice;
	public OrderLine(int orderID, int productID, int quantity, double unitprice) {
		this.orderID = orderID;
		this.productID = productID;
		this.quantity = quantity;
		this.unitprice = unitprice;
	}
	public OrderLine() {
		
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(double unitprice) {
		this.unitprice = unitprice;
	}
	
	
}
