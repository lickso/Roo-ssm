package com.roo.ssm.dao; 

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.User;

public interface User_RoleDao extends BaseDao{  
	
	//ͨ���û�id��ѯ��ɫid
	public Set<Integer> queryRoleIdByUserId(@Param("userId")int userId);
	
//	public User queryUserByName(@Param("name")String name);
	
	
	
	
	
//	public User userlogin(@Param("name")String name,@Param("password")String password);
	
	
	//private String 
      
    //����û�
	//public int insert(User user);
	
	//public int 
    
    //
    //ɾ���û�
    //public boolean deleteUser(int id);
   
    //�޸��û���Ϣ
    //public boolean editUser(User user);
    
    //����������ѯ�û���Ϣ
    //public User qryUserById(int id);
    
    //��ѯ�û���Ϣ�б�
    //List<User> findAll();

    //public boolean findUserByNameAndPwd(String name, String password);
      
    //�����û����������ѯ�û�  
    //ע��������������Զ���װ��map���ϣ������ڼ�Ϊ�� 
    
    //public boolean findUserByNameAndPwd(@Param("name")String name, @Param("password")String password);   
    
      
}   