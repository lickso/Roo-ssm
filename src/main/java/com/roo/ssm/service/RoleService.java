package com.roo.ssm.service;

import java.util.Set;

public interface RoleService {
	
	//�����û�id��ѯ��ɫ�б�
	public Set<String> queryRoleByUserId(String userId);
	
	
	
	/*
	int userLogin(User user);
	
	//ͨ���û�����ѯ�û���Ϣ
	User queryUserByName(String name);
	
    //�û�ע��  
    int addUser(User user);
    
    int addByBase(User user);*/
    
    
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