package com.Entity;

public class User {
	private int uid;
	private String username;
	private String password;
	private String email;
	private String role;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(int userID, String username, String password, String email, String role) {
		this.uid = userID;
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
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
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "UserID: "+uid+" | Username: "+username+" | Password: "+password+" | email: "+email+" | Role: "+role;
	}
}
