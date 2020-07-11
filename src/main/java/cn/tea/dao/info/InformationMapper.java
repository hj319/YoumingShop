package cn.tea.dao.info;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Information;
@Repository
public interface InformationMapper {
	
	@Insert("INSERT INTO tea_information(uid,ititle,infor,sendTime) value(#{uid},#{ititle},#{infor},#{sendTime})")
	int addInfor(Information info);
	
	//根据id查询留言
	List<Information> getInfo(@Param("uid") Integer uid);

}
