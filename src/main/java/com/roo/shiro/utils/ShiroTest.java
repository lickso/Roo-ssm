package com.roo.shiro.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

public class ShiroTest {
	
	
	public static void main(String[] args) {
		
		// 创建securityManager工厂，通过ini配置文件创建securityManager工厂
		Factory<SecurityManager> factory = new IniSecurityManagerFactory("C:/Users/yangsheng/Desktop/shiro-first.ini");

		// 创建SecurityManager
		SecurityManager securityManager = factory.getInstance();

		// 将securityManager设置当前的运行环境中
		SecurityUtils.setSecurityManager(securityManager);

		// 从SecurityUtils里边创建一个subject
		Subject subject = SecurityUtils.getSubject();

		// 在认证提交前准备token（令牌）
		// 这里的账号和密码 将来是由用户输入进去
		UsernamePasswordToken token = new UsernamePasswordToken("zhangsan","100");
		

		try {
			// 执行认证提交
			subject.login(token);
		} catch (AuthenticationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 是否认证通过
		boolean isAuthenticated = subject.isAuthenticated();
		System.out.println("是否认证通过：" + isAuthenticated);
		
		// 是否有角色
		boolean isHasRole = subject.hasRole("role1");
		System.out.println("用户是否有该角色：" + isAuthenticated);
		
		// 是否有角色
		boolean isHasPermission = subject.isPermitted("user:create");
		System.out.println("用户是否有该权限：" + isHasPermission);

		
		// 退出操作
		subject.logout();
	}
}
