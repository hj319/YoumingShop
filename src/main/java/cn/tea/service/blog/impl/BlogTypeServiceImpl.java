package cn.tea.service.blog.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.blog.BlogTypeMapper;
import cn.tea.pojo.BlogType;
import cn.tea.service.blog.BlogTypeService;

@Service
public class BlogTypeServiceImpl implements BlogTypeService {

	@Autowired
	private BlogTypeMapper blogTypeMapper;
	public List<BlogType> getBlogType() {
		return blogTypeMapper.getBlogType();
	}

}
