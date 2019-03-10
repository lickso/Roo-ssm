package com.roo.ssm.dao; 

import java.util.Set;

import org.apache.ibatis.annotations.Param;
import com.roo.ssm.bean.User;

public interface Role_PermissionDao extends BaseDao{  
	
	//ͨ����ɫid��ѯȨ��id
	public Set<Integer> queryPermissionIdByRoleId(@Param("roleId")int roleId);
	
}   