package com.roo.ssm.dao; 

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.Product_Collection;

public interface Product_CollectionDao extends BaseDao{  
	
	
	
	//根据用户id查询用户地址
	//public Set<String> queryPlaceByUserId(@Param("userId")int userId);
	
	//根据用户id查询收藏列表
	public List<Product_Collection> queryProduct_CollectionListByUserId(@Param("userId")int userId);
	
	
}   