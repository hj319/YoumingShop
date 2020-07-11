package cn.tea.service.blog;

import java.util.List;

import cn.tea.pojo.BlogComments;

public interface BlogCommentsService {
	List<BlogComments> getComm(int bid);
	boolean addComm(BlogComments comm);
}
