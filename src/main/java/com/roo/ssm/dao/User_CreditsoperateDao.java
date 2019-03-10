package com.roo.ssm.dao; 

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface User_CreditsoperateDao extends BaseDao{  
	
	//根据用户id查询积分操作数据集
	public List<Integer> queryOperatesumByUserId(@Param("userId")int userId);
	
	//根据用户id查询积分操作数据集
	public List<Integer> querySignInOperatesumByUserId(@Param("userId")int userId);
	
	//用户积分实例添加-基类。。
	

}   