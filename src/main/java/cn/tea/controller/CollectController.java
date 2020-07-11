package cn.tea.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tea.pojo.Blog;
import cn.tea.pojo.BlogCollect;
import cn.tea.pojo.Product;
import cn.tea.pojo.ProductCollect;
import cn.tea.pojo.User;
import cn.tea.service.blog.BlogService;
import cn.tea.service.product.ProductService;
@Controller
public class CollectController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private ProductService productService;
	//��ʾ�����ղ���Ϣ
	 @RequestMapping(value="/Collect",method=RequestMethod.GET)
	    public String getCollect(Model model) {
		 List<BlogCollect> list=blogService.getCollectList();
		 List<ProductCollect> pro=productService.getProCollectList();
	        model.addAttribute("blog",list);
	        model.addAttribute("pro",pro);
	        return "collect";
	    }
	 //ɾ�������ղ�
	 @RequestMapping(value="/delCol",method=RequestMethod.GET)
	    public String delCol(@RequestParam("bid") int bid,HttpSession session) {
		 int uid=((User)session.getAttribute("loginUser")).getUid();
		 boolean isOk=blogService.delCollect(bid, uid);
	        if(isOk){
	        	return "redirect:Collect";
	        }
			return "redirect:Collect";
	    }
		 //ɾ����Ʒ�ղ�
		 @RequestMapping(value="/delProCol",method=RequestMethod.GET)
		    public String delProCol(@RequestParam("pid") int pid,HttpSession session) {
			 int uid=((User)session.getAttribute("loginUser")).getUid();
			 boolean isOk=productService.delCollect(pid, uid);
		        if(isOk){
		        	return "redirect:Collect";
		        }
				return "redirect:Collect";
		    }
}
