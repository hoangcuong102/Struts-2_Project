package com.Actions;

import java.util.List;

import com.DataAccess.DAO;
import com.Entity.Category;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2045201341267211180L;
	private int cid;
	private String cname;
	
	private Category category;
	private List<Category> listCategory;
	private String command;
	private DAO dao;
	
	public CategoryAction() throws Exception {
		// TODO Auto-generated constructor stub
		dao = new DAO();
	}
	
	public String getCategorys() throws Exception{
		listCategory = dao.getCategory();
		if(listCategory!=null) {
			return SUCCESS;
		}
		return ERROR;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(command.equals("get")) {
			return getCategorys();
		}
		return ERROR;
	}
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getListCategory() {
		return listCategory;
	}

	public void setListCategory(List<Category> listCategory) {
		this.listCategory = listCategory;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}
	
	
}
