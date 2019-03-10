package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository("Role")
public class Role implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	private String name;
	private String desc;
	private String state;
}
