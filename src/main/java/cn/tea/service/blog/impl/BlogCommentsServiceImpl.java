package cn.tea.service.blog.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.blog.BlogCommentsMapper;
import cn.tea.pojo.BlogComments;
import cn.tea.service.blog.BlogCommentsService;
@Service
public class BlogCommentsServiceImpl implements BlogCommentsService {

	@Autowired
	private BlogCommentsMapper blogCommentsMapper;
	
	public List<BlogComments> getComm(int bid) {
		return blogCommentsMapper.getComm(bid);
	}
	
	public boolean addComm(BlogComments comm) {
		int result=blogCommentsMapper.addComm(comm);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
}
