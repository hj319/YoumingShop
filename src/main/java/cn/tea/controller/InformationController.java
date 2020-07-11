package cn.tea.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tea.pojo.Information;
import cn.tea.pojo.User;
import cn.tea.service.info.InformationService;

@Controller
public class InformationController {
	@Autowired
	private InformationService infoService;
	
	@RequestMapping(value="/addInfo",method = RequestMethod.POST)
	public String addInfo(
			@RequestParam(value="ititle",required=false) String ititle, 
			@RequestParam(value="infor",required=false) String infor,
			Information info,HttpSession session) {
		int uid=((User)session.getAttribute("loginUser")).getUid();
		info.setUid(uid);
		info.setItitle(ititle);
		info.setInfor(infor);
		info.setSendTime(new Date());
		boolean isOk=infoService.addInfor(info);
		if(isOk) {
			return "about";
		}else {
			return "about";
		}
	}
	//通过uid查询我的消息
	@RequestMapping(value="/getInfo",method = RequestMethod.GET)
	public String getInfo(
			HttpSession session) {
		int uid=((User)session.getAttribute("loginUser")).getUid();
		List<Information> info=infoService.getInfo(uid);
        session.setAttribute("info",info);
        return "information";
	}

}
