package com.roo.ssm.service.impl; 
  
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roo.ssm.bean.User;
import com.roo.ssm.controller.UserController;
import com.roo.ssm.dao.BaseDao;
import com.roo.ssm.dao.PermissionDao;
import com.roo.ssm.dao.Role_PermissionDao;
import com.roo.ssm.dao.UserDao;
import com.roo.ssm.dao.User_PlaceDao;
import com.roo.ssm.dao.User_RoleDao;
import com.roo.ssm.service.UserService;


@Service  
public class UserServiceImpl implements UserService {  
	private static final transient Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	private User user;
	
    @Autowired  
    private UserDao userDao;
    
    @Autowired  
    private User_RoleDao user_RoleDao;
    
    @Autowired  
    private Role_PermissionDao role_PermissionDao;
    
    @Autowired  
    private PermissionDao permissionDao;
    
    @Autowired  
    private User_PlaceDao user_PlaceDao;
    
  	public int userRegister(User user) {    	
		return userDao.insert(user);
	};
    
    public User queryUserByName(String name) {    	
  		return userDao.queryUserByName(name);
  	};
    
  	public Set<Integer> queryRoleIdByUserId(int userId) {    	
		return user_RoleDao.queryRoleIdByUserId(userId);
	};
	
	public Set<Integer> queryPermissionIdByRoleId(Set<Integer> rolesId) { 
		Set<Integer> PermissionIdsSet = new HashSet();
		for (int roleId : rolesId) {  
			Set<Integer> PermissionIdSet =  role_PermissionDao.queryPermissionIdByRoleId(roleId);
			PermissionIdsSet.addAll(PermissionIdSet);
		}
		return PermissionIdsSet;
	};
	
	public Set<String> queryPermissionSetByPermissionIdSet(Set<Integer> permissionsId) { 
		Set<String> PermissionsSet = new HashSet();
		for (int permissionId : permissionsId) {  
			Set<String> PermissionSet =  permissionDao.queryPermissionUrlByPermissionId(permissionId);
			PermissionsSet.addAll(PermissionSet);
		}
		return PermissionsSet;
	};
    
	public int userLogin(User user) {
		
		return 0;
	}  
    
    
    public int addUser(User user) { 
    	
    	return userDao.insert(user);
    }

	public int addByBase(User user) {
		return 0;
	}

	//根据用户id，查询用户地址
	public Set<String> queryPlaceByUserIdSet(int userId){
		return user_PlaceDao.queryPlaceByUserId(userId);
	}
    
} 