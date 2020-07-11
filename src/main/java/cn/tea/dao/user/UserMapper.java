package cn.tea.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.User;

@Repository
public interface UserMapper {
	 //注册
	@Insert("insert into tea_user(uname,uemail,upassword,uphone,uaddress) values(#{uname},#{uemail},#{upassword},#{uphone},#{uaddress})")
     int register(User user);
	//判断用户是否存在
	@Select("select count(*) from tea_user where uemail=#{uemail}")
	int findUserByUemail(@Param("uemail") String uemail);
	//登录
	@Select("select * from tea_user  where uname=#{uname} and upassword=#{upassword}")
	 User login(@Param("uname") String uname,@Param("upassword") String upassword);
	//通过uid查询个人信息
    @Select("select * from tea_user where uid=#{uid}")
    List<User> findByUid(@Param("uid") int uid);
	//修改账号信息
    int updateUser(User user);
    //修改密码
    int updatePsw(@Param("uname") String uname,@Param("upassword") String upassword);
    
}
