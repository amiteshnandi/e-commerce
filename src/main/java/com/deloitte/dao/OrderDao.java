package com.deloitte.dao;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import com.deloitte.model.*;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrder(Order model) {
		boolean result = false;
		
		try {
			query = "insert into orders (product_id, user_id, order_quantity, order_date, order_status, delivery_date) values(?,?,?,?,?,DATE_ADD(order_date, INTERVAL 7 DAY))";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			pst.setString(5, model.getStatus());
			pst.executeUpdate();
			result = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Order> userOrders(int id){
		List<Order> list = new ArrayList<>();
		
		try {
			query = "select * from user_database.orders where user_id=? and order_status in ('Processing','Delivered') order by orders.order_id desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con);
				int pId = rs.getInt("product_id");
				
				Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("order_id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setImage(product.getImage());
				order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
				order.setQuantity(rs.getInt("order_quantity"));
				order.setDate(rs.getString("order_date"));
				order.setStatus(rs.getString("order_status"));
				list.add(order);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void cancelOrder(int id) {
		try {
			
//			query = "delete from user_database.orders where order_id=?";
			query = "update user_database.orders set order_status='Canceled' where order_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.executeUpdate();

			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	
}
