package com.roo.utils.test; 
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.roo.ssm.bean.User;
import com.roo.ssm.bean.User_Creditsoperate;



    
  
public interface CreditsService extends OrderService ,OutShowService{
	
	//根据用户id查询积分操作金额
	public List<Integer> queryOperatesumByUserId(int userId);
	
	//根据用户id查询签到积分操作金额
	public List<Integer> querySignInOperatesumByUserId(int userId);
	
	//用户积分实例添加操作
	public int addUserCreditsOperateObject(User_Creditsoperate user_Creditsoperate);
	
} 