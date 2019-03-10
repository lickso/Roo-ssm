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
		
		// ����securityManager������ͨ��ini�����ļ�����securityManager����
		Factory<SecurityManager> factory = new IniSecurityManagerFactory("C:/Users/yangsheng/Desktop/shiro-first.ini");

		// ����SecurityManager
		SecurityManager securityManager = factory.getInstance();

		// ��securityManager���õ�ǰ�����л�����
		SecurityUtils.setSecurityManager(securityManager);

		// ��SecurityUtils��ߴ���һ��subject
		Subject subject = SecurityUtils.getSubject();

		// ����֤�ύǰ׼��token�����ƣ�
		// ������˺ź����� ���������û������ȥ
		UsernamePasswordToken token = new UsernamePasswordToken("zhangsan","100");
		

		try {
			// ִ����֤�ύ
			subject.login(token);
		} catch (AuthenticationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// �Ƿ���֤ͨ��
		boolean isAuthenticated = subject.isAuthenticated();
		System.out.println("�Ƿ���֤ͨ����" + isAuthenticated);
		
		// �Ƿ��н�ɫ
		boolean isHasRole = subject.hasRole("role1");
		System.out.println("�û��Ƿ��иý�ɫ��" + isAuthenticated);
		
		// �Ƿ��н�ɫ
		boolean isHasPermission = subject.isPermitted("user:create");
		System.out.println("�û��Ƿ��и�Ȩ�ޣ�" + isHasPermission);

		
		// �˳�����
		subject.logout();
	}
}
