package com.roo.ssm.dao; 

import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface User_PlaceDao extends BaseDao{  
	
	//根据用户id查询用户地址
	public Set<String> queryPlaceByUserId(@Param("userId")int userId);

}   