package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;


@Repository("User_Creditsoperate")
public class User_Creditsoperate implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userid;
	private String operatedate;
	private String operatetype;
	private int operatesum;
	private String des;
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
	public String getOperatedate() {
		return operatedate;
	}
	public void setOperatedate(String operatedate) {
		this.operatedate = operatedate;
	}
	public String getOperatetype() {
		return operatetype;
	}
	public void setOperatetype(String operatetype) {
		this.operatetype = operatetype;
	}
	public int getOperatesum() {
		return operatesum;
	}
	public void setOperatesum(int operatesum) {
		this.operatesum = operatesum;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
