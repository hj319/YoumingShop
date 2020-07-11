package cn.tea.service.blog.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.pojo.Blog;
import cn.tea.pojo.BlogCollect;
import cn.tea.service.blog.BlogService;
@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private cn.tea.dao.blog.BlogMapper blogMapper;
	public List<Blog> getBlogList() {
		return blogMapper.getBlogList();
	}
	public List<Blog> findBybid(int bid) {
		return blogMapper.findBybid(bid);
	}
	public List<Blog> getBlogByTitle(String btitle, Integer tid) {
		return blogMapper.getBlogByTitle(btitle, tid);
	}
	public boolean addBlog(Blog blog) {
		int result=blogMapper.addBlog(blog);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	public boolean updateView(int bid) {
		int isOk=blogMapper.updateView(bid);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public BlogCollect getCollect(int bid,int uid) {
		return blogMapper.getCollect(bid,uid);
	}
	public boolean updateCollect(int bid,int uid) {
		int isOk=blogMapper.updateCollect(bid,uid);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public boolean insertCollect(BlogCollect collect) {
		int isOk=blogMapper.insertCollect(collect);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public boolean delCollect(int bid,int uid) {
		int isOk=blogMapper.delCollect(bid,uid);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public List<BlogCollect> getCollectList() {
		return blogMapper.getCollectList();
	}
}
