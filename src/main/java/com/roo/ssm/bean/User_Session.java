package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository("User_Session")
public class User_Session implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String host;
	private String starttime;
	private String lastaccess;
	private String timeout;
	private String state;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getLastaccess() {
		return lastaccess;
	}
	public void setLastaccess(String lastaccess) {
		this.lastaccess = lastaccess;
	}
	public String getTimeout() {
		return timeout;
	}
	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
