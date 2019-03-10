package com.roo.ssm.service.impl; 
  
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roo.ssm.bean.Order;
import com.roo.ssm.bean.Order_Product;
import com.roo.ssm.dao.OrderDao;
import com.roo.ssm.dao.Order_ProductDao;
import com.roo.ssm.service.OrderService;

@Service  
public class OrderServiceImpl implements OrderService {  
	private static final transient Logger logger = Logger.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private Order_ProductDao order_ProductDao;
	
	//工单实例添加
	public int insertOrderObject(Order order) {
		orderDao.insert(order);
		return order.getId();
	}

	//工单商品明细添加
	public int insertOrderProductObject(Order_Product order_Product) {
		return order_ProductDao.insert(order_Product);
	}

	public List<Order> queryOrderObjectByUserId(int userId) {
		return orderDao.queryOrderObjectByUserId(userId);
	}
	
	//根据工单id，查询工单商品信息
	public List<Order_Product> queryOrderProductByOrderId(int orderId) {
		return order_ProductDao.queryOrder_ProductByOrderId(orderId);
	}

	//通过用户id查询工单数量
	public int queryOrderCountByUserId(int userId,String state) {
		return orderDao.queryOrderCountByUserId(userId, state);
	}

	//订单修改
	public int checkOrder(Order order) {
		return orderDao.update(order);
	};
	
} 