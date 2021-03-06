package com.Entity;


public class Product {
	private String pid;
	private int cid;
	private String pname;
	private double price;
	private String color;
	private String brand;
	private int discount;
	private String descript;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(String pid, int cid, String pname, double price, String color, String brand, int discount,
			String descript) {
		this.pid = pid;
		this.cid = cid;
		this.pname = pname;
		this.price = price;
		this.color = color;
		this.brand = brand;
		this.discount = discount;
		this.descript = descript;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}
	

}
