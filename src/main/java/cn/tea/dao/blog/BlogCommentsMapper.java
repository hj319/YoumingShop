package cn.tea.dao.blog;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.BlogComments;
@Repository
public interface BlogCommentsMapper {

	// 通过bid查询博客回复信息
	List<BlogComments> getComm(@Param("bid") int bid);
	//增加博客评论
	@Insert("INSERT INTO tea_blogcomments(bid,uid,ucontent,utime) value(#{bid},#{uid},#{ucontent},#{utime})")
	int addComm(BlogComments comm);
}
