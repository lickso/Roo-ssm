package com.roo.ssm.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.User;

public interface RoleDao extends BaseDao{  
	
	//用户id查询角色列表【在基类dao里已经实现】
	public Set<String> queryRoleByUserId(@Param("userId")String userId);
	
	//	public User userlogin(@Param("name")String name,@Param("password")String password);
	
}   