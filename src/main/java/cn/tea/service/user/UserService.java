package cn.tea.service.user;

import java.util.List;

import cn.tea.pojo.User;

public interface UserService {
	//注册
	 boolean register(User user);
    //验证用户是否存在
	 boolean findUserByUemail(String uemail);
	// 登录
     User login(String uname,String upassword);
     //根据uid查询个人信息
     List<User> findByUid(int uid);
     //修改用户信息
     boolean updateUser(User user);
     //修改密码
     boolean updatePsw(String uname,String upassword);
}
