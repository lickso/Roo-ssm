package com.roo.shiro.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.permission.WildcardPermission;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.roo.shiro.service.IAuthenticateService;
import com.roo.ssm.bean.Permission;
import com.roo.ssm.bean.Role;
import com.roo.ssm.bean.User;
import com.roo.ssm.service.UserService;

/**
 * @desc   登录认证接口
 * @author yangsheng
 * @date   2018-03-06
 * 
 */
public class AuthenticateServiceImpl extends  AuthorizingRealm  implements IAuthenticateService {
	
	private static final transient Logger logger = Logger.getLogger(AuthenticateServiceImpl.class);
	
	@Autowired
	private User user;
	
	@Autowired
	private UserService userService;
	
	@Override
	public void setName(String name) {
		super.setName("rooAuthorizingRealm");
	}
	
	/*public User authenticate(String name ,String password) {
		userService.userlogin(name, password);
		return userService.userlogin(name, password);
	}*/

	//授权获得用户权限信息
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {
		logger.info("进入用户授权");
		/*SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
		info.addRole("321");
		info.addRole("3332");
		info.addStringPermission("333");
		info.addStringPermission("555");
		info.addObjectPermission(new WildcardPermission("44"));
		return info;*/
		
		//用户验证通过，进入授权，获取到用户的用户名
		String userName = (String)super.getAvailablePrincipal(collection); 
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(); 
		
//		List<Role> roleList = memberService.selectRoleByMemberId(member.getId());  
//        List<Permission> permList = memberService.selectPermissionByMemberId(member.getId()); 
		return info;
		
	}

	//认证获取用户身份信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		logger.info("进入登录认证");
		
		UsernamePasswordToken loginToken=(UsernamePasswordToken)token;
		String name=new String(loginToken.getUsername());
		String password=new String(loginToken.getPassword());
		logger.info("传入用户名称："+name);
		logger.info("传入用户密码："+password);
		
		//当存在用户登录验证码时
		Session session = getSession(); 
		
		if(loginToken.getUsername()=="123"&&password.equals("123")){
            
        }else{
            throw new IncorrectCredentialsException("用户登录失败！");
        }
		SimpleAuthenticationInfo info= new SimpleAuthenticationInfo(name,password,this.getName());
		
		//设置会话session
		this.setSession("user", "ys"); 
		
		
		return info;
	}
	
	private void setSession(Object key, Object value){  
        Session session = getSession();  
        System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");  
        if(null != session){  
            session.setAttribute(key, value);  
        }  
    }  
      
    private Session getSession(){  
        try{  
            Subject subject = SecurityUtils.getSubject();  
            Session session = subject.getSession(false);  
            if (session == null){  
                session = subject.getSession();  
            }  
            if (session != null){  
                return session;  
            }  
        }catch (InvalidSessionException e){  
              
        }  
        return null;  
    }  
}
