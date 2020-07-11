package cn.tea.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


public class Blog {
	private int id;
	private int bid;
	private int uid;
	private int tid;
	private String btitle;
	private String bimg;
	private String bcontent;
	private String bmajor;
	private int blike;
	private int bview;
	private int bshare;
	private int cid;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date createTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date modifyTime;
    private User user;  // 用户实体
    
    private BlogType blogType;  // 博客分类实体
    //private BlogComments blogComments;//博客回复实体

	public int getId() {
		return id;
	}

	public int getBid() {
		return bid;
	}

	public int getUid() {
		return uid;
	}

	public int getTid() {
		return tid;
	}

	public String getBtitle() {
		return btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public String getBmajor() {
		return bmajor;
	}

	public int getBlike() {
		return blike;
	}

	public int getBview() {
		return bview;
	}

	public int getBshare() {
		return bshare;
	}

	public int getCid() {
		return cid;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public User getUser() {
		return user;
	}

	public BlogType getBlogType() {
		return blogType;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public void setBmajor(String bmajor) {
		this.bmajor = bmajor;
	}

	public void setBlike(int blike) {
		this.blike = blike;
	}

	public void setBview(int bview) {
		this.bview = bview;
	}

	public void setBshare(int bshare) {
		this.bshare = bshare;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setBlogType(BlogType blogType) {
		this.blogType = blogType;
	}

	public String getBimg() {
		return bimg;
	}

	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
    
}
