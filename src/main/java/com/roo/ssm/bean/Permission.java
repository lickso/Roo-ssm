package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository("Permission")
public class Permission implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private String url;
	private String state;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
