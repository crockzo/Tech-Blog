package com.blog.entities;

public class Category {
	private String cname;
	private int cid;
	
	
	public Category() {

	}
	public Category(String cname) {
		this.cname = cname;
	}
	
	public Category(String cname, int cid) {
		super();
		this.cname = cname;
		this.cid = cid;
	}
	
	
	
	public String getCname() {
		return cname;
	}
	
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public int getCid() {
		return cid;
	}
	
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
}
