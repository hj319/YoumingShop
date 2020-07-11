package cn.tea.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.tea.pojo.BlogComments;
import cn.tea.pojo.User;
import cn.tea.service.blog.BlogCommentsService;

@Controller
public class BlogCommentsController {
	@Autowired
	private BlogCommentsService blogCommService;
	
	@RequestMapping(value="/AddComm",method =RequestMethod.POST)
	@ResponseBody
	public Object addComm(BlogComments comm,HttpSession session,
			@RequestParam("bid") int bid,@RequestParam("ucontent") String ucontent) {
		//if(((User)session.getAttribute("loginUser"))==null) return "login";
		Map<String,Integer> map=new HashMap<String,Integer>();
		int uid=((User)session.getAttribute("loginUser")).getUid();
	    comm.setUid(uid);
	    comm.setBid(bid);
	    comm.setUcontent(ucontent);
	    comm.setUtime(new Date());
	    boolean isOk=blogCommService.addComm(comm);
	    if(isOk) {
	    	map.put("result", 1);
	    }else {
	    	map.put("result", 0);
	    }
	    return JSON.toJSONString(map);
	}
	
	@RequestMapping("/getComm")
	@ResponseBody
	public Object Comm(HttpSession session,Model model) {
		int bid=(Integer)session.getAttribute("bid");
		List<BlogComments> comm=blogCommService.getComm(bid);
		return JSON.toJSONString(comm);
	}

}
