package cn.tea.service.blog;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tea.pojo.Blog;
import cn.tea.pojo.BlogCollect;

public interface BlogService {
	//查询所有的博客信息
    List<Blog> getBlogList();
    //根据id查询博客
    List<Blog> findBybid(int bid);
    //根据标题查询博客
    List<Blog> getBlogByTitle(String btitle,Integer tid);
    //增加博客信息
    boolean addBlog(Blog blog);
  //浏览+1
  	boolean updateView(int bid);
  //查询收藏
  BlogCollect getCollect(int bid,int uid);
  //收藏+1
  boolean updateCollect(int bid,int uid);
  //加入收藏表
  boolean insertCollect(BlogCollect collect);
  //删除收藏表记录
  boolean delCollect( int bid,int uid);
	//查询收藏信息
	List<BlogCollect> getCollectList();
}
