package com.DataAccess;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import com.Entity.Category;
import com.Entity.Product;
import com.Entity.User;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class DAO {
	private Reader rd;
	private SqlMapClient smc;
	
	public DAO() throws Exception {
		 rd = Resources.getResourceAsReader("SqlMapConfig.xml");
	     smc = SqlMapClientBuilder.buildSqlMapClient(rd);
	}
	
	public User login(User u) throws Exception{
		return (User) smc.queryForObject("User.getUser", u);
	}
	
	public User getUserByID(int uid) throws Exception{
		return (User) smc.queryForObject("User.getUserById",uid);
	}
	
	public int updateUser(User u) throws Exception{
		return smc.update("User.updateUser", u);
	}
	
	public List<Product> getProducts() throws Exception{
		return (List<Product>) smc.queryForList("Product.getProducts",null);
	}
	
	public Product getProductById(String pid) throws Exception{
		return (Product) smc.queryForObject("Product.getProductById",pid);
	}
	
	public int updateProduct(Product p) throws Exception{
		return smc.update("Product.update", p);
	}
	
	public int deleteProduct(String pid) throws Exception{
		return smc.delete("Product.deleteProduct", pid);
	}
	
	public List<Category> getCategory() throws Exception{
		return (List<Category>) smc.queryForList("Category.getCategory",null);
	}
	
	public List<String> getImages(String pid) throws Exception{
		return (List<String>) smc.queryForList("Product.getImages",pid);
	}
	
	public void addProduct(Product p) throws Exception{
		  smc.insert("Product.addProduct",p);
	}
	
	
	public static void main(String[]rgs)throws IOException,SQLException{
		
	      Reader rd = Resources.getResourceAsReader("SqlMapConfig.xml");
	      SqlMapClient smc = SqlMapClientBuilder.buildSqlMapClient(rd);

	      /* This would insert one record in Employee table. */
	      System.out.println("Going to insert record.....");
	      List<String> list = (List<String>) smc.queryForList("Product.getImages","BB6166");
	      System.out.println(list.size());
	      
	     
	     
	      System.out.println("Record Inserted Successfully ");
	   }
 }
