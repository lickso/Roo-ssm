package com.roo.ssm.service; 
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.roo.ssm.bean.User;



    
  
public interface UserService {
	//用户登录
	int userLogin(User user);
	
	//根据用户名查询用户
	User queryUserByName(String name);
	
	//用户注册
	public int userRegister(User user);
	
    //添加用户
    int addUser(User user);
    
    int addByBase(User user);
    
    
    
    //用户id查询角色id列表
    public Set<Integer> queryRoleIdByUserId(int userId);
	
	//角色id查询权限id列表
	public Set<Integer> queryPermissionIdByRoleId(Set<Integer> rolesId) ;
	
	//权限id列表查询权限列表
	public Set<String> queryPermissionSetByPermissionIdSet(Set<Integer> permissionsId) ;
    
    //根据用户id查询用户地址
	public Set<String> queryPlaceByUserIdSet(int userId) ;
	
	
	
	
    //�û���¼  
    //boolean login(String name, String password);  
    
    //ɾ���û�
    //boolean deleteUser(int id);
    //�޸��û�
    //boolean editUser(User user);
    //����������ѯ�û���Ϣ
    //User qryUserById(int id);
    //��ѯ�û��б�
    //List<User> findAll();

} 