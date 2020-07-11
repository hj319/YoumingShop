package cn.tea.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Cart;
import cn.tea.pojo.Product;
import cn.tea.pojo.User;
import cn.tea.service.cart.CartService;

@Controller
public class CartController {
	//操作购物车接口对象
	@Autowired
	private CartService cartService;
	
	//点击购物车图标，添加该商品到购物车，默认数量为1，pid不为空查询出该产品数据,为空查所有
	@RequestMapping(value="addCart",method=RequestMethod.GET)
	@ResponseBody
	public String addCart(
			@RequestParam("pid") Integer pid,
			@RequestParam("originalPrice") Double originalPrice,
			@RequestParam("discountPrice") Double discountPrice,
			@RequestParam(name="iddd",required = false,defaultValue = "1") int iddd,
			Model model,HttpSession session) {
		if(((User)session.getAttribute("loginUser"))==null) return "login";
		int uid = ((User)session.getAttribute("loginUser")).getUid();//用户id
		int num=iddd;//商品数量
		Double price;//单价
		Double total;//总价
		//1是pid
		Product product=cartService.getComPrice(pid);
		if(originalPrice==null) {
			price =originalPrice;
		}else {
			price = discountPrice;
		}
		total = price * num;
		//System.out.println(price);
		//System.out.println(num);
		//System.out.println(total);
		User user = cartService.getUser(uid);
		Cart cart=new Cart();
		cart.setUname(user.getUname());
		cart.setNum(num);
		cart.setPid(pid);
		cart.setUid(uid);
		cart.setTotal(total);
		boolean isOk= cartService.addCart(cart);
		List<Cart> list=cartService.getCartList(uid);
		model.addAttribute("list",list );
		if(isOk) {
			return "true";
		}else {
			return "false";
		}
	}
	
	//分页，获得购物车列表
	@RequestMapping(value="getCartList",method=RequestMethod.GET)
	public String getCartList(
			Model model,HttpSession session,
			@RequestParam(name="currpage",required=false,defaultValue = "1") int currpage) {
		if(((User)session.getAttribute("loginUser"))==null) return "login";
		//调用PageHelp类的方法，startPage就是去获得分页的数据
		PageHelper.startPage(currpage,4);
		int uid = ((User)session.getAttribute("loginUser")).getUid();
		List<Cart> list=cartService.getCartList(uid);
		System.out.println(list);
		//创建一个分页类的实例
		PageInfo pageInfo= new PageInfo(list,4);
		model.addAttribute("pageInfo",pageInfo);
		return "cart";
	}
	
	//批量删除购物车列表
	@RequestMapping(value="deleteCartAll",method=RequestMethod.POST)
	@ResponseBody
	public String deleteCartAll(@RequestParam("c") String c) {
		//split把字符串分割成字符串数组
		String[] i=c.split(",");
		boolean isOk = cartService.deleteCartAll(i);
		if(isOk) {
			return "true";
		}else {
			return "false";
		}	
	}
	
	/**更新购物车
	 * @param id 当前信息编号
	 * @param num 商品数量
	 * @param total
	 * @return
	 */
	@RequestMapping(value="updateCart",method=RequestMethod.POST)
	@ResponseBody
	public String updateCart(
			@RequestParam("id") int id,@RequestParam("num") int num,
			@RequestParam("total") double total,HttpSession session) {
		if(((User)session.getAttribute("loginUser"))==null) return "login";
		int uid = ((User)session.getAttribute("loginUser")).getUid();//用户id
		Cart cart = new Cart();
		cart.setNum(num);
		cart.setId(id);
		cart.setTotal(total);
		cart.setUid(uid);
		boolean isOk=cartService.updateCart(cart);
		if(isOk) {
			return "true";
		}
		return "false";
	}
}
