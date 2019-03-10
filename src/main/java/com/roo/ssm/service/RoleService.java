package com.roo.ssm.service;

import java.util.Set;

public interface RoleService {
	
	//根据用户id查询角色列表
	public Set<String> queryRoleByUserId(String userId);
	
	
	
	/*
	int userLogin(User user);
	
	//通过用户名查询用户信息
	User queryUserByName(String name);
	
    //用户注册  
    int addUser(User user);
    
    int addByBase(User user);*/
    
    
    //用户登录  
    //boolean login(String name, String password);  
    
    //删除用户
    //boolean deleteUser(int id);
    //修改用户
    //boolean editUser(User user);
    //依照主键查询用户信息
    //User qryUserById(int id);
    //查询用户列表
    //List<User> findAll();

} 