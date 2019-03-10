package com.roo.ssm.bean;

import java.io.Serializable;

import org.springframework.stereotype.Repository;


@Repository("Product_Collection")
public class Product_Collection implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userid;
	private int productid;
	private String collectiondate;
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
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getCollectiondate() {
		return collectiondate;
	}
	public void setCollectiondate(String collectiondate) {
		this.collectiondate = collectiondate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
