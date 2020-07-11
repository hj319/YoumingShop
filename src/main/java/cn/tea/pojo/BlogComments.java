package cn.tea.pojo;

import java.util.Date;

public class BlogComments {
	private int cid;
	private int bid;
	private int uid;
	private String ucontent;
	private Date utime;
	private User user;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUcontent() {
		return ucontent;
	}
	public void setUcontent(String ucontent) {
		this.ucontent = ucontent;
	}
	public Date getUtime() {
		return utime;
	}
	public void setUtime(Date utime) {
		this.utime = utime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
