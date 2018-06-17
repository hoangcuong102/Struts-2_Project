package com.Actions;

import java.util.List;

import com.DataAccess.DAO;
import com.Entity.Category;
import com.Entity.Product;
import com.Entity.ProductForm;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ProductForm {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4187541723473921257L;

	
	private DAO dao;
	private Product product;
	private List<Product> listProduct;
	private List<Category> listCategory;
	private Object obj;
	private List<String> listImage;
	

	

	public ProductAction() throws Exception {
		// TODO Auto-generated constructor stub
		dao = new DAO();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("command:"+getCommand());
		if(getCommand().equals("view")) {
			getCategory();
			return getProducts();
		}else if(getCommand().equals("viewedit")) {
			getCategory();
			return getProductById();
		}else if(getCommand().equals("edit")) {
			return updateProduct();
		}else if(getCommand().equals("delete")) {
			return deleteProduct();
		}else if(getCommand().equals("viewImage")) {
			return getImages();
		}else if(getCommand().equals("add")) {
			
			 //getCategory();
			 return addProduct();
		}
		return ERROR;
	}
	
	
	public String getProducts() throws Exception{
		listProduct = dao.getProducts();
		if(listProduct.size() !=0) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String getProductById() throws Exception{
		product = dao.getProductById(getPid());
		if(product != null)
			return SUCCESS;
		return ERROR;
	}
	
	public String updateProduct() throws Exception{
		Product p = new Product(getPid(),getCid(),getPname(),getPrice(),getColor(),getBrand(),getDiscount(),getDescript());
		if(dao.updateProduct(p)!=0) {
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	public String deleteProduct() throws Exception{
		if(dao.deleteProduct(getPid())!=0) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String getCategory() throws Exception{
		listCategory = dao.getCategory();
		if(listCategory != null) {
			return SUCCESS;
			
		}
		return ERROR;
	}
	
	public String getImages() throws Exception{
		listImage = dao.getImages(getPid());
		if(listImage!=null) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String addProduct() throws Exception{
		Product p = new Product(getPid(),getCid(),getPname(),getPrice(),getColor(),getBrand(),getDiscount(),getDescript());
		dao.addProduct(p);
		return SUCCESS;
	}
	
	

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}
	public List<Category> getListCategory() {
		return listCategory;
	}

	public void setListCategory(List<Category> listCategory) {
		this.listCategory = listCategory;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public List<String> getListImage() {
		return listImage;
	}

	public void setListImage(List<String> listImage) {
		this.listImage = listImage;
	}
	
	
}
