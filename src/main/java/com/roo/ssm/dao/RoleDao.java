package com.roo.ssm.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.User;

public interface RoleDao extends BaseDao{  
	
	//�û�id��ѯ��ɫ�б��ڻ���dao���Ѿ�ʵ�֡�
	public Set<String> queryRoleByUserId(@Param("userId")String userId);
	
	//	public User userlogin(@Param("name")String name,@Param("password")String password);
	
}   