package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;


@Repository("Shop")
public class Shop implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private String des;
	private String imgurl;
	private String focusnum;
	private String viewsnum;
	private String starttime;
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
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getFocusnum() {
		return focusnum;
	}
	public void setFocusnum(String focusnum) {
		this.focusnum = focusnum;
	}
	public String getViewsnum() {
		return viewsnum;
	}
	public void setViewsnum(String viewsnum) {
		this.viewsnum = viewsnum;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
