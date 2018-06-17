package com.ibatis;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import com.Entity.Account;
import com.Entity.Customer;
import com.Entity.Order;
import com.Entity.OrderLine;
import com.Entity.Product;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class ibatisProduct {
	private Reader rd;
	private SqlMapClient smc;
	
	
	
	public ibatisProduct() throws IOException {
		 rd = Resources.getResourceAsReader("SqlMapConfig.xml");
	     smc = SqlMapClientBuilder.buildSqlMapClient(rd);
	}
	
	public List<Product> getProduct() throws Exception {
		return (List<Product>) smc.queryForList("Product.getAll", null);
	}
	
	public Account isRightAccount(Account a) throws Exception {
		return (Account) smc.queryForObject("Account.isRightAccount", a);
	}
	
	public int update(Product p) throws SQLException {
		return smc.update("Product.updateProduct", p);
	}
	
	public void add(Product p) throws Exception{
		
		  smc.insert("Product.addProduct", p);
	}
	
	public int delete(int id) throws Exception{
		try {
			return smc.delete("Product.deleteProduct", id);
		}catch(Exception e) {
			return 0;
		}
	}
	
	public List<Order> getAllOrder() throws Exception{
		return (List<Order>) smc.queryForList("Order.getAllOrder", null);
	}
	
	public Product getProductByID(int id) throws SQLException {
		return (Product) smc.queryForObject("Product.getProductById", id);
	}
	
	public List<OrderLine> getOrderlinebyOrderID(int orderid) throws Exception{
		return (List<OrderLine>) smc.queryForList("OrderLine.getOrderLine", orderid);
	}
	
	public Customer getCustomerByID(String customerid) throws Exception{
		return (Customer) smc.queryForObject("Customer.getCustomerByID", customerid);
	}
	
	static Logger log = Logger.getLogger(ibatisProduct.class.getName());
	
	public static void main(String[]rgs)throws IOException,SQLException{
		
	      Reader rd = Resources.getResourceAsReader("SqlMapConfig.xml");
	      SqlMapClient smc = SqlMapClientBuilder.buildSqlMapClient(rd);

	      /* This would insert one record in Employee table. */
	      System.out.println("Going to insert record.....");
	      
	      List<OrderLine> lis =(List<OrderLine>) smc.queryForList("OrderLine.getOrderLine", 10248);
	      System.out.println(lis.size());
	      
	     
	     
	      System.out.println("Record Inserted Successfully ");
	   }
}
