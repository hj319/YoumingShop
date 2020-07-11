package cn.tea.service.info;

import java.util.List;

import cn.tea.pojo.Information;

public interface InformationService {
    //增加留言
	boolean addInfor(Information info);
	List<Information> getInfo(Integer uid);
}
