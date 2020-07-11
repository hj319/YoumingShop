package cn.tea.dao.blog;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tea.pojo.BlogType;

@Repository
public interface BlogTypeMapper {
	//查询所有的分类信息方法
		 List<BlogType> getBlogType();
}
