package com.Actions;

import com.Entity.Customer;
import com.ibatis.ibatisProduct;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7470128984076796872L;
	
	private String customerID;
	private String customerName;
	
	private String command;
	private Customer customer;
	private ibatisProduct dao;
	
	 public CustomerAction() throws Exception {
		// TODO Auto-generated constructor stub
		dao = new ibatisProduct();
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(command.equals("viewcustomer")) {
			customer = dao.getCustomerByID(customerID);
			if(customer != null) {
				return SUCCESS;
			}
		}
		return ERROR;
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

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

}
