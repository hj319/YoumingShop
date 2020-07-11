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
	//��ѯ���еĲ�����Ϣ
    List<Blog> getBlogList();
    //����id��ѯ����
    List<Blog> findBybid(int bid);
    //���ݱ����ѯ����
    List<Blog> getBlogByTitle(String btitle,Integer tid);
    //���Ӳ�����Ϣ
    boolean addBlog(Blog blog);
  //���+1
  	boolean updateView(int bid);
  //��ѯ�ղ�
  BlogCollect getCollect(int bid,int uid);
  //�ղ�+1
  boolean updateCollect(int bid,int uid);
  //�����ղر�
  boolean insertCollect(BlogCollect collect);
  //ɾ���ղر��¼
  boolean delCollect( int bid,int uid);
	//��ѯ�ղ���Ϣ
	List<BlogCollect> getCollectList();
}
