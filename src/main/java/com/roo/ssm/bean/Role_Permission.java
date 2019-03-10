package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository("Role_Permission")
public class Role_Permission  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String tip;
	private int roleid;
	private int permissionid;
	private String state;
	
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public int getPermissionid() {
		return permissionid;
	}
	public void setPermissionid(int permissionid) {
		this.permissionid = permissionid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
