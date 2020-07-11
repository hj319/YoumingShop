package cn.tea.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.user.UserMapper;
import cn.tea.pojo.User;
import cn.tea.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	public boolean register(User user) {
		 int result = userMapper.register(user);
	        if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}
	
	  public boolean findUserByUemail(String uemail) {
		  if(userMapper.findUserByUemail(uemail)==0){
			  return true; 
			  }else { 
				  return false; 
			}
	}
	  //µÇÂ¼
	  public User login(String uname, String upassword) {
			return userMapper.login(uname, upassword);
		}
	  public List<User> findByUid(int uid) {
			return userMapper.findByUid(uid);
		}
	  public boolean updateUser(User user) {
			int result=userMapper.updateUser(user);
			if(result>0) {
				return true;
			}else {
				return false;
			}
		}

		public boolean updatePsw(String uname, String upassword) {
			int result=userMapper.updatePsw(uname, upassword);
			if(result>0) {
				return true;
			}else {
				return false;
			}
		}
}
