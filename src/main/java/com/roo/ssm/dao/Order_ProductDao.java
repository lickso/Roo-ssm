package com.roo.ssm.dao; 

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.Order_Product;

public interface Order_ProductDao extends BaseDao{  
	
	//根据用户id查询用户地址
	//	public Set<String> queryPlaceByUserId(@Param("userId")int userId);
	
	//通过订单编号，查找订单产品信息
	public List<Order_Product> queryOrder_ProductByOrderId(@Param("orderId")int orderId);

}   