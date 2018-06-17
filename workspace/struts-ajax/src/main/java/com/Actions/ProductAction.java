package com.Actions;

import java.io.IOException;
import java.util.List;

import com.DBContext.DAO;
import com.Entity.Product;
import com.ibatis.ibatisProduct;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5009897514440137605L;
	//private final DAO dao;
	private ibatisProduct dao;
	private List<Product> listProduct;
	
	private int productId;
	private String productName;
	private float productPrice;

	private Product product;
	private String command;
	
	

	public ProductAction() throws IOException {
		 dao = new ibatisProduct();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("out");
		System.out.println("command: "+command);
		System.out.println("name:"+productName);
		System.out.println("price: "+productPrice);
		if(command.equals("view")) {
			listProduct = new DAO().getProducts();
			System.out.println("VIEW PRICE: "+listProduct.get(1).getProductPrice());
			if(listProduct.size()!=0) 
				return SUCCESS;
		}else if(command.equals("editview")){
			return getProductByID();
		}else if(command.equals("edit")) {
			return update();
		}else if(command.equals("delete")) {
			return delete();
		}else if(command.equals("add")) {
			System.out.println("In");
			System.out.println("command: "+command);
			System.out.println("name:"+productName);
			System.out.println("price: "+productPrice);
			return add();
		}
		
		return ERROR;
	}
	
	public String getProductByID() throws Exception {
		
		product = new DAO().getProductByID(productId);
		if (product != null) {
			return "editview";
		} else {
			return ERROR;
		}
	}
	/*
	 * Add new product
	 */
	public String add() throws Exception {
		
		dao.add(new Product(0,productName, productPrice)) ;
			return SUCCESS;
		
	}
	
	/*
	 * Update product
	 */
	public String update() throws Exception {

	
		if (dao.update(new Product(productId, productName, productPrice))!=0) {
			
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	/*
	 * Delete a product by it's ID
	 */
	public String delete() throws Exception {
		
		if (dao.delete(productId) !=0) {
			
			return SUCCESS;
		} else {
			
			return ERROR;
		}

	}

	
	public void validate() {
		if (productName != null) {
			// request.setAttribute("notice", "Product Name can not be blank");
			if (productName.trim().equals(""))
				addFieldError("productName", "This field can not be blank");
		}
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

}
