package cn.tea.service.blog;

import java.util.List;

import cn.tea.pojo.BlogType;

public interface BlogTypeService {
	//查询所有的分类信息方法
		List<BlogType> getBlogType();
}
