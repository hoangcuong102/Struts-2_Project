package com.Entity;

public class Product {
	private int productID;
	private String productName;
	private float productPrice;
	
	public Product() {
		
	}
	
	public Product(int id, String name, float price) {
		productID = id;
		productName = name;
		productPrice = price;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}
}
