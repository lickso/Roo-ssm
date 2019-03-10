package com.roo.ssm.service.impl; 
  

import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roo.ssm.bean.Role;
import com.roo.ssm.bean.User;
import com.roo.ssm.dao.UserDao;
import com.roo.ssm.dao.RoleDao;
import com.roo.ssm.service.RoleService;
import com.roo.ssm.service.UserService;

@Service  
public class RoleServiceImpl implements RoleService {  
	private static final transient Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	private Role role;
	
	@Autowired  
    private RoleDao RoleDao;  
    
    //通过用户id查询角色列表
    public Set<String> queryRoleByUserId(String userid) {    	
  		return RoleDao.queryRoleByUserId(userid);
  	};
    
    
    
    
    
    
//    @Autowired  
//    private BaseDao baseDao;  
    
    
	/*public int userLogin(User user) {
		logger.info("登录请求的用户名，密码为：" + user.getName() + "[AND]" + user.getPassword());
		
		
		
	    try {  
	        
	    } catch (UnknownAccountException ex) {  
	        return "用户不存在或者密码错误！";  
	    } catch (IncorrectCredentialsException ex) {  
	        return "用户不存在或者密码错误！";  
	    } catch (AuthenticationException ex) {  
	        return ex.getMessage(); // 自定义报错信息  
	    } catch (Exception ex) {  
	        ex.printStackTrace();  
	        return "内部错误，请重试！";  
	    }  
		return 0;
	}  
    */
    
   /* public int addUser(User user) { 
    	
        //return userDao.insert("com.roo.ssm.dao.UserDao.insert",user);
    	return userDao.insert(user);
    	
    	//对于Component组件来说就相当于将其注册到beans里。所以在beans里获取
    	//ApplicationContext ctx = new ClassPathXmlApplicationContext("/config/beans.xml");
    	
    	//使用释放上下文
    	AbstractApplicationContext context = new ClassPathXmlApplicationContext("/config/spring/spring.xml");
        
    	
    	UserDao userDao = (UserDao) context.getBean("user");
    	userDao.addUser(user);
    	
    	context.close();//释放资源
    	
    }

	@Override
	public int addByBase(User user) {
		// TODO Auto-generated method stub
		return 0;
	}*/

	
    
    /*public int addByBase(User user) {
//    	return userDao.insert("addUser", user);
    }*/
  
    /*public boolean login(String name, String password) {  
        return userDao.findUserByNameAndPwd(name,password);  
    }*/

	/*public boolean deleteUser(int id) {
		return userDao.deleteUser(id);
	}*/

	/*public boolean editUser(User user) {
		return userDao.editUser(user);
	}*/

	/*public User qryUserById(int id) {
		User user=userDao.qryUserById(id);
		return user;
	}*/

	/*public List<User> findAll() {
		List<User> list=userDao.findAll();
		return list;
	}  */
} 