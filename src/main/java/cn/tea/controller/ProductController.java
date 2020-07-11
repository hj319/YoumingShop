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
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Blog;
import cn.tea.pojo.Product;
import cn.tea.pojo.ProductCollect;
import cn.tea.pojo.ProductMessage;
import cn.tea.pojo.ProductType;
import cn.tea.pojo.User;
import cn.tea.service.blog.BlogService;
import cn.tea.service.product.ProductMessageService;
import cn.tea.service.product.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductMessageService messageService;
	@Autowired
	private BlogService blogService;
	 // 查询所有商品
    @RequestMapping(value="/index",method=RequestMethod.GET)
    public String getProduct(Model model) {
        List<Product> product = productService.getProductAll();
        List<Blog> blist=blogService.getBlogList();
        model.addAttribute("list",product);
    	model.addAttribute("blist", blist);
        return "index";
    }
    @RequestMapping(value="/shop",method=RequestMethod.GET)
    public String getProducts(@RequestParam(name="currpage",defaultValue="1") int currpage,
    		@RequestParam(name="pname",required = false) String pname,
    		@RequestParam(name="tid",required = false) Integer tid,
    		Model model) {
    	PageHelper.startPage(currpage,6);
        List<Product> product = productService.getProductBy(pname, tid);
        PageInfo pageInfo=new PageInfo(product,6);
        List<ProductType> productType = productService.getProductTypeAll();
        model.addAttribute(pageInfo);
        model.addAttribute("list1",productType);
        return "shop";
    }
        //根据id查询商品
    @RequestMapping(value = "/productSingle",method = RequestMethod.GET)
    public String findByPid(@RequestParam(name="pid") int pid,HttpSession session,
    		Model model) {
    	List<Product> product=productService.findByPid(pid);
    	List<Product> product1=productService.getProductAll();
    	List<ProductMessage> message=messageService.getMessage(pid);
    	productService.updateView(pid);
    	model.addAttribute("list", product);
    	model.addAttribute("list1", product1);
    	model.addAttribute("message", message);
    	session.setAttribute("pid", pid);
		return "product-single";
    }
    
    //查询是否被收藏
    @RequestMapping(value = "/getCollect",method = RequestMethod.GET)
    @ResponseBody
    public Object getCollect(@RequestParam("pid") int pid,HttpSession session) {
    	int uid = ((User)session.getAttribute("loginUser")).getUid();
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	ProductCollect collect=productService.getCollect(pid,uid);
            if (collect != null) {
            	 map.put("res", 1);
            } else {
            	 map.put("res", 0);
            }
            return JSON.toJSONString(map);
        }

    //删除收藏
	@RequestMapping(value = "/delCollect",method = RequestMethod.GET)
	@ResponseBody
	public Object delCollect(@RequestParam("pid") int pid,HttpSession session) {
		int uid = ((User)session.getAttribute("loginUser")).getUid();
		Map<String, Integer> map = new HashMap<String, Integer>();
		boolean isOk=productService.delCollect(pid,uid);
	        if (isOk) {
	        	 map.put("del", 1);
	        } else {
	        	 map.put("del", 0);
	        }
	        return JSON.toJSONString(map);
	    }
	  //增加收藏
		@RequestMapping(value = "/insertCollect",method = RequestMethod.GET)
		@ResponseBody
		public Object insertCollect(@RequestParam("pid") int pid,HttpSession session,ProductCollect collect) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int uid = ((User)session.getAttribute("loginUser")).getUid();
			collect.setUid(uid);
			collect.setPid(pid);
			boolean isOk=productService.insertCollect(collect);
		        if (isOk) {
		        	 map.put("ins", 1);
		        } else {
		        	 map.put("ins", 0);
		        }
		        return JSON.toJSONString(map);
		    }
}