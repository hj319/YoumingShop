package cn.tea.dao.blog;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Blog;
import cn.tea.pojo.BlogCollect;
@Repository
public interface BlogMapper {
	//查询所有的博客信息
		List<Blog> getBlogList();
		//根据id查询博客
		List<Blog> findBybid(@Param("bid") int bid);
		//根据标题查询博客
		List<Blog> getBlogByTitle(@Param("btitle") String btitle,@Param("tid") Integer tid);
		//增加博客
		@Insert("insert into tea_blog(btitle,tid,bimg,bcontent,uid,createTime)"
				+"values(#{btitle},#{tid},#{bimg},#{bcontent},#{uid},#{createTime})")
		int addBlog(Blog blog);
		//浏览+1
		@Update("UPDATE tea_blog SET bview=bview+1 WHERE bid=#{bid}")
		int updateView(@Param("bid") int bid);
		//查询收藏
		@Select("SELECT * FROM tea_blogcollect WHERE bid=#{bid} and uid=#{uid}")
		BlogCollect getCollect(@Param("bid") int bid,@Param("uid") int uid);
		//收藏+1
		@Update("UPDATE tea_blog SET blike=blike+1 WHERE bid=#{bid} and uid=#{uid}")
		int updateCollect(@Param("bid") int bid,@Param("uid") int uid);
		//加入收藏表
		@Insert("INSERT INTO tea_blogcollect(bid,uid)VALUE(#{bid},#{uid})") 
		int insertCollect(BlogCollect collect);
		//删除收藏表记录
		@Delete("DELETE FROM tea_blogcollect WHERE bid=#{bid} and uid=#{uid}")
		int delCollect(@Param("bid") int bid,@Param("uid") int uid);
		//查询收藏信息
		List<BlogCollect> getCollectList();
}
