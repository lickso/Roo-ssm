package com.roo.utils.test; 
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.Order;
import com.roo.ssm.bean.Order_Product;
 
public interface OrderService {
	
	//工单对象添加
	public int insertOrderObject(Order order);
	
	//根据用户id查询用户工单信息
	public List<Order> queryOrderObjectByUserId(int userId);
	
	//商品工单明细添加
	public int insertOrderProductObject(Order_Product order_Product);
	
	//通过工单id查询工单商品信息
	public List<Order_Product> queryOrderProductByOrderId(int orderId);
	
	//通过用户id查询工单商品数量
	public int queryOrderCountByUserId(int userId,String state);
	
} 