package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository("Artdesign_Imgresource")
public class Artdesign_Imgresource  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int ordernumber;
	private int artdesignid;
	private String url;
	private String state;
	private String desc;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(int ordernumber) {
		this.ordernumber = ordernumber;
	}
	public int getArtdesignid() {
		return artdesignid;
	}
	public void setArtdesignid(int artdesignid) {
		this.artdesignid = artdesignid;
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

}
