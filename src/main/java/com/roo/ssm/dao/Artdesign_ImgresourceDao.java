package com.roo.ssm.dao; 

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.roo.ssm.bean.Artdesign_Imgresource;
import com.roo.ssm.bean.Product_Artdesign;
import com.roo.ssm.bean.User;

public interface Artdesign_ImgresourceDao extends BaseDao{  
	
	//根据平面设计商品id查询平面资源数据对象
	public List<Artdesign_Imgresource> queryArtdesign_ImgresourceByartdesignid(@Param("artdesignid")int artdesignid);
	
	
	
	
	//添加用户【基类操作】
	//public int insert(User user);
	
	//通过用户名查询信息
	//public User queryUserByName(@Param("name")String name);
	
	
	
	
	
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