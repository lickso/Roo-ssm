package com.roo.ssm.dao; 

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.Order;

public interface OrderDao extends BaseDao{ 
	
	//根据用户id查询工单信息
	public List<Order> queryOrderObjectByUserId(@Param("userId")int userId);
	
	//根据工单状态查询工单数
	public int queryOrderCountByUserId(@Param("userId")int userId,@Param("state")String state);
	
	//根据用户id查询用户地址
	//public Set<String> queryPlaceByUserId(@Param("userId")int userId);

}   