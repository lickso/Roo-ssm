package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;


@Repository("User_Place")
public class User_Place implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userid;
	private String setdate;
	private String name;
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
	public String getSetdate() {
		return setdate;
	}
	public void setSetdate(String setdate) {
		this.setdate = setdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
