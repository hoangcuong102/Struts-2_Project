package com.Actions;

import java.util.Date;
import java.util.List;

import com.Entity.Order;
import com.Entity.OrderLine;
import com.ibatis.ibatisProduct;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6060369308210655920L;
	
	private int orderID;
	private Date orderDate;
	private String customerID;
	private String payment;
	
	private ibatisProduct dao;
	private List<Order> listOrder;
	private List<OrderLine> listOrderLine;
	private String command;
	
	public OrderAction() throws Exception{
		dao = new ibatisProduct();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(command.equals("view")) {
			listOrder = dao.getAllOrder();
			return SUCCESS;
		}else if(command.equals("vieworder")) {
			listOrderLine = dao.getOrderlinebyOrderID(orderID);
			return SUCCESS;
		}
		return ERROR;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

	public List<Order> getListOrder() {
		return listOrder;
	}

	public void setListOrder(List<Order> listOrder) {
		this.listOrder = listOrder;
	}

	public List<OrderLine> getListOrderLine() {
		return listOrderLine;
	}

	public void setListOrderLine(List<OrderLine> listOrderLine) {
		this.listOrderLine = listOrderLine;
	}

}
