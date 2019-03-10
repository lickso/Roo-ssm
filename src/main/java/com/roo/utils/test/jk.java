package com.roo.utils.test;

import java.util.List;

import org.springframework.web.context.support.StaticWebApplicationContext;

import com.roo.ssm.bean.Advertise_Carousel;
import com.roo.ssm.bean.Order;
import com.roo.ssm.bean.Order_Product;
import com.roo.ssm.bean.User_Creditsoperate;

public class jk implements CreditsService{
	
	public String j ;
	
	private int k;
	
	public int getK() {
		return k;
	}

	public void setK(int k) {
		this.k = k;
	}

	public int insertOrderObject(Order order) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Order> queryOrderObjectByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertOrderProductObject(Order_Product order_Product) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Order_Product> queryOrderProductByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int queryOrderCountByUserId(int userId, String state) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Advertise_Carousel> queryAllAdvertise_Carousel() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Integer> queryOperatesumByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Integer> querySignInOperatesumByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int addUserCreditsOperateObject(User_Creditsoperate user_Creditsoperate) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	private class jj extends Thread{
		String i ;
	}
}

class jk1 implements CreditsService{

	public int insertOrderObject(Order order) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Order> queryOrderObjectByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertOrderProductObject(Order_Product order_Product) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Order_Product> queryOrderProductByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int queryOrderCountByUserId(int userId, String state) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Advertise_Carousel> queryAllAdvertise_Carousel() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Integer> queryOperatesumByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Integer> querySignInOperatesumByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int addUserCreditsOperateObject(User_Creditsoperate user_Creditsoperate) {
		// TODO Auto-generated method stub
		return 0;
	}

}
