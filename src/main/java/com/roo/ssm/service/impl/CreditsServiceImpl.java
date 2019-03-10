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
import com.roo.ssm.bean.User_Creditsoperate;
import com.roo.ssm.controller.UserController;
import com.roo.ssm.dao.BaseDao;
import com.roo.ssm.dao.PermissionDao;
import com.roo.ssm.dao.Role_PermissionDao;
import com.roo.ssm.dao.UserDao;
import com.roo.ssm.dao.User_CreditsoperateDao;
import com.roo.ssm.dao.User_PlaceDao;
import com.roo.ssm.dao.User_RoleDao;
import com.roo.ssm.service.CreditsService;
import com.roo.ssm.service.UserService;

  
@Service  
public class CreditsServiceImpl implements CreditsService {  
	private static final transient Logger logger = Logger.getLogger(CreditsServiceImpl.class);
    
    @Autowired  
    private User_CreditsoperateDao user_CreditsoperateDao;
    
    
    //根据用户id查询操作金额列表
    public List<Integer> queryOperatesumByUserId(int userId) {
		return user_CreditsoperateDao.queryOperatesumByUserId(userId);
	}


	public int addUserCreditsOperateObject(User_Creditsoperate user_Creditsoperate) {
		return user_CreditsoperateDao.insert(user_Creditsoperate);
	}


	public List<Integer> querySignInOperatesumByUserId(int userId) {
		return user_CreditsoperateDao.querySignInOperatesumByUserId(userId);
	}
    
} 