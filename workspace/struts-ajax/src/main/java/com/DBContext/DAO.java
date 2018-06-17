package com.DBContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DBContext.DAO;
import com.Entity.Account;
import com.Entity.Order;
import com.Entity.Product;

public class DAO {
	private final String serverName = "localhost";
	private final String portNumber = "1433";
	private final String dbName = "SaleDB";
	private final String userID = "sa";
	private final String password = "Cuong2807";

	public DAO() {

	}
	
	public Account isRightAccount(String username, String password, String role) throws Exception {
		Account ac = null;
		String sql = "select * from Account where username = ? and password = ? and role = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new DAO().openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, role);
			rs = ps.executeQuery();
			while (rs.next()) {
				int accID = rs.getInt(1);
				String user = rs.getString(2);
				String pass = rs.getString(3);
				String rol = rs.getString(4);
				ac = new Account(accID, user, pass, rol);
			}
		} catch (Exception e) {
			closeConnection(con, ps, rs);
			throw e;
		} finally {
			closeConnection(con, ps, rs);
		}
		return ac;
	}

	public final Connection openConnection() throws Exception {
		Connection con = null;
		try {
			String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url, userID, password);
			return con;
		} catch (Exception e) {
			throw e;
		}

	}

	public void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) throws Exception {
		if (rs != null && (!rs.isClosed())) {
			rs.close();
		}
		if (ps != null && (!(ps.isClosed()))) {
			ps.close();
		}
		if (con != null && (!(con.isClosed()))) {
			con.close();
		}
	}
	
	public List<Product> getProducts() throws Exception{
		List<Product> list = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from ProductTBL";
		try {
			con = openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				float price = rs.getFloat(3);
				list.add(new Product(id, name, price));
			}
		}catch(Exception e) {
			closeConnection(con, ps, rs);
			throw e;
		}finally {
			closeConnection(con, ps, rs);
			
		}
		return list;
	}
	
	public Product getProductByID(int id) throws Exception {
		String sql = "select * from ProductTBL where ProductID = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Product p = null;
		try {
			con = new DAO().openConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				int proid = rs.getInt(1);
				String name = rs.getString(2);
				float price = rs.getFloat(3);
				p = new Product(proid, name, price);
			}
		} catch (Exception e) {
			closeConnection(con, ps, rs);
			throw e;

		} finally {
			closeConnection(con, ps, rs);
		}
		return p;
	}
	/*
	 * Update Product
	 */
	public boolean update(int id, String name, float price) throws Exception {
		String sql = "update ProductTBL set ProductName = ?, UnitPrice = ? where ProductID = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new DAO().openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setFloat(2, price);
			ps.setInt(3, id);
			if (ps.executeUpdate() == 1) {
				closeConnection(con, ps, rs);
				return true;
			}
		} catch (Exception e) {
			closeConnection(con, ps, rs);
			throw e;

		} finally {
			closeConnection(con, ps, rs);
		}
		return false;
	}
	/*
	 * Add new product
	 */
	public boolean addProduct(String name, float price) throws Exception {
		String sql = "insert into ProductTBL(ProductName,UnitPrice) values(?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new DAO().openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setFloat(2, price);
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (Exception e) {
			closeConnection(con, ps, rs);
			throw e;
		} finally {
			closeConnection(con, ps, rs);
		}
		return false;
	}
	/*
	 * Delete a product by it's ID
	 */
	public boolean deleteProduct(int productid) throws Exception {
		String sql = "delete from ProductTBL where ProductID = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new DAO().openConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productid);
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (Exception e) {
			closeConnection(con, ps, rs);
			throw e;
		} finally {
			closeConnection(con, ps, rs);
		}
		return false;
	}
	
	
	public static void main(String[] avgs) throws Exception {
		System.out.println(new DAO().getProducts().size());
	}
}
