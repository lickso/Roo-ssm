package com.roo.ssm.dao; 

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.roo.ssm.bean.Product_Artdesign;
import com.roo.ssm.bean.User;

public interface Shop_ProductDao extends BaseDao{ 
	
	//通过店铺id查询商品
	public List<Product_Artdesign> queryProductSetByShopId(@Param("shopId")String shopId);
	
	
	//添加用户【基类操作】
	//public int insert(User user);
	
	
	
	
	
	
	
//	public User userlogin(@Param("name")String name,@Param("password")String password);
	
	
	//private String 
      
    //添加用户
	//public int insert(User user);
	
	//public int 
    
    //
    //删除用户
    //public boolean deleteUser(int id);
   
    //修改用户信息
    //public boolean editUser(User user);
    
    //根据主键查询用户信息
    //public User qryUserById(int id);
    
    //查询用户信息列表
    //List<User> findAll();

    //public boolean findUserByNameAndPwd(String name, String password);
      
    //根据用户名和密码查询用户  
    //注解的两个参数会自动封装成map集合，括号内即为键 
    
    //public boolean findUserByNameAndPwd(@Param("name")String name, @Param("password")String password);   
    
      
}   