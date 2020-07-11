package cn.tea.controller;

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

import cn.tea.pojo.ProductMessage;
import cn.tea.pojo.User;
import cn.tea.service.product.ProductMessageService;

@Controller
public class ProduceMessageController {
	@Autowired
	private ProductMessageService messageService;
	
	@RequestMapping(value = "/AddProMessage",method = RequestMethod.POST)
	@ResponseBody
	public Object AddProMessage(ProductMessage message,HttpSession session,
			@RequestParam("pid") int pid,@RequestParam("mcontent")String mcontent) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		 int uid = ((User)session.getAttribute("loginUser")).getUid();
		 message.setUid(uid);
		 message.setPid(pid);
		 message.setMcontent(mcontent);
		 boolean isOk=messageService.add(message);
		 if(isOk) {
	            map.put("code", 1);
	        }else {
	            map.put("code",0);
	        }
	        return JSON.toJSONString(map);
	}
	
	@RequestMapping("/getMessage")
	@ResponseBody
	public Object message(HttpSession session,
    		Model model) {
		int pid=(Integer) session.getAttribute("pid");
		List<ProductMessage> message=messageService.getMessage(pid);
		return JSON.toJSONString(message);
	}
	
}
