package cn.tea.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class BlogCollect {
	 private int id;
	 private int bid;
	 private int uid;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JSONField(format = "yyyy-MM-dd")
	private Date createTime;
	private int createBy;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JSONField(format = "yyyy-MM-dd")
	private Date modifyTime;
	private int modifyBy;
	private Blog blog;
	public int getId() {
			return id;
	}
	public void setId(int id) {
			this.id = id;
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
	public Date getCreateTime() {
			return createTime;
		}
	public void setCreateTime(Date createTime) {
			this.createTime = createTime;
		}
	public int getCreateBy() {
			return createBy;
		}
	public void setCreateBy(int createBy) {
			this.createBy = createBy;
		}
	public Date getModifyTime() {
			return modifyTime;
		}
	public void setModifyTime(Date modifyTime) {
			this.modifyTime = modifyTime;
		}
	public int getModifyBy() {
			return modifyBy;
		}
	public void setModifyBy(int modifyBy) {
			this.modifyBy = modifyBy;
		}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	
}
