package cn.tea.pojo;

import java.util.Date;

public class Information {
   private int iid;
   private int uid;
   private String ititle;
   private String infor;
   private String reply;
   private Date sendTime;
   private User user;
public int getIid() {
	return iid;
}
public int getUid() {
	return uid;
}
public String getItitle() {
	return ititle;
}
public String getInfor() {
	return infor;
}
public String getReply() {
	return reply;
}
public Date getSendTime() {
	return sendTime;
}
public void setIid(int iid) {
	this.iid = iid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public void setItitle(String ititle) {
	this.ititle = ititle;
}
public void setInfor(String infor) {
	this.infor = infor;
}
public void setReply(String reply) {
	this.reply = reply;
}
public void setSendTime(Date sendTime) {
	this.sendTime = sendTime;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
   
}
