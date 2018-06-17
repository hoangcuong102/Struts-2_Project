package com.Actions;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.DataAccess.DAO;
import com.Entity.User;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6058595773046932484L;

	private int uid;
	private String username;
	private String password;
	private String email;
	private String role;
	private String remember;

	private User user;
	private String command;
	private DAO dao;
	private Map<String, Object> userSession;
	private String message;

	public UserAction() throws Exception {
		dao = new DAO();
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub	
		System.out.println(uid);
			if(message == null && command !=null) {
				if(command.equals("view")) {
					return getUserById();
				}
				if(command.equals("edit")) {
					
					return update();
				}
				if(command.equals("logout")) {
					return logout();
				}else if(command.equals("login")) {
					return login();
				}
				
			}else {
				return INPUT;
			}
			
		
		return ERROR;
	}
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		System.out.println(command);
		System.out.println(uid);
		
		if(command != null && command.equals("login")) {
			validateWhenLogin();
		}else if(command != null && command.equals("register")) {
			validateWhenRegisterOrUpdate();	
		}else if(command != null && command.equals("edit")) {
			validateWhenRegisterOrUpdate();	
		}
	}
	
	public String login() throws Exception{
		if (userSession.containsKey("LoginUser")) {		
			message = "You already login to system";
		} else {
			try {	
				user = dao.login(new User(0, username, password, email, ""));
				
				if(user.getRole().trim().equals("admin")) {
					if(remember.equals("on")) {
						Cookie c = new Cookie("USERLOGIN", ""+user.getUid());
						 c.setMaxAge(60);
						 ServletActionContext.getResponse().addCookie(c);
					}
					ServletActionContext.getRequest().getSession().setAttribute("LoginUser", user);
					return SUCCESS;
				}else {
					message = "You need Admin account to login";
				}
			} catch (Exception e) {
				message = "Username or Password not correct";
			}
		}
		return ERROR;
	}
	
	public String logout() throws Exception{
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
	
	public String update() throws Exception{
		if(dao.updateUser(new User(uid, username, password, email, role))!=0) {
				return SUCCESS;
		}
		return ERROR;
	}
	
	public String getUserById() throws Exception{
		User x = dao.getUserByID(uid);
		if(x!=null) {
			setUsername(x.getUsername());
			setPassword(x.getPassword());
			setEmail(x.getEmail());
			return SUCCESS;
		}
		return ERROR;
	}
	
	public void validateWhenLogin() {
		if(username == null || username.trim().length()  == 0){		
			message = "Username field can not blank";
		}else if(password ==null || password.trim().length() == 0){
			message = "Password field can not blank or contains space characters";
		}
	}
	
	public void validateWhenRegisterOrUpdate() {
		if(username.trim().length()  == 0){
			message = "Username field can not blank";
		}else if(password.trim().length() == 0){
			message = "Password field can not blank or contains space characters";
		}else if(!email.matches("^\\w+[\\.\\w]*@(\\w+\\.)+\\w+(\\.[a-z]{2,4})*$")) {
			message = "Email not correct format";
		}
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

	public void setSession(Map<String, Object> session) {
		userSession = session;

	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	public String getRemember() {
		return remember;
	}

	public void setRemember(String remember) {
		this.remember = remember;
	}
}
