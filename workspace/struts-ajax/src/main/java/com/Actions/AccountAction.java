package com.Actions;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.DBContext.DAO;
import com.Entity.Account;
import com.ibatis.ibatisProduct;
import com.opensymphony.xwork2.ActionSupport;

public class AccountAction extends ActionSupport implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2742682692075477478L;
	
	private int accountID;
	private String username;
	private String password;
	private String role;
	
	

	private Map<String, Object> userSession;
	//private  DAO dao;
	private ibatisProduct dao;
	private Account account;
	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if (userSession.containsKey("LoginUser")) {
			addFieldError("username", "Account has already login to system");
			return ERROR;
		} else {
			dao = new ibatisProduct();
			Account ac = dao.isRightAccount(new Account(0,username,password,role));
			if (ac != null) {
				 ServletActionContext.getRequest().getSession().setAttribute("LoginUser", ac);
				return SUCCESS;
			} else {
				addFieldError("username", "Username or Password not correct");
				return ERROR;
			}
		}
	}
	
	public String logout() throws Exception {
		System.out.println(userSession.get("LoginUser"));
		//userSession.remove("LoginUser");
		 userSession.clear();

		return SUCCESS;
	}
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if (username != null) {
			if (username.trim().equals(""))
				addFieldError("username", "This field not be blank");
		}
		if (password != null) {
			if (password.trim().equals(""))
				addFieldError("password", "This field not be blank");
			else if (password.trim().length() < 8) 
					addFieldError("password", "Password must be have at least 8 characters");
		}
	}
	

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.userSession = session;
		
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	public int getAccountID() {
		return accountID;
	}


	public void setAccountID(int accountID) {
		this.accountID = accountID;
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


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

}
