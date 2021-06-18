package com.blog.entities;

public class Post {
	
	
	private int pid;
	private String ptitle;
	private String pcontent;
	private int uid;
	private int cid;
	
	public Post() {
		super();
	}
	public Post(String ptitle, String pcontent, int uid, int cid) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.uid = uid;
		this.cid = cid;
	}
	public Post(int pid, String ptitle, String pcontent, int uid, int cid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.uid = uid;
		this.cid = cid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
	
	
	
}
