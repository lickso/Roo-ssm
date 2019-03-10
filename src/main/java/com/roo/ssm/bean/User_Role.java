package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository("User_Role")
public class User_Role  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userid;
	private int roleid;
	private String desc;
	private String state;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
