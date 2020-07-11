package cn.tea.controller;

import java.util.ArrayList;
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

import cn.tea.pojo.Order;
import cn.tea.pojo.OrderDetails;
import cn.tea.pojo.User;
import cn.tea.service.cart.CartService;
import cn.tea.service.cart.OrderDetailsService;
import cn.tea.service.cart.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	public OrderService orderService;
	//操作购物车接口对象
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderDetailsService orderDetailsService;
	static int ding=0;
	//保存数据的方法
	@RequestMapping(value="storeAll",method=RequestMethod.POST)
	@ResponseBody
	public String storeAll(@RequestParam("c") String c,HttpSession session,
			@RequestParam("id") String id,@RequestParam("img") String img) {
		//转换成数组形式
		String[] i=c.split(",");
		//创建集合，保存订单详情数据
		List<OrderDetails> ordlist=new ArrayList<OrderDetails>();
		//
		Order order = new Order();
		//计算循环次数，每次循环从下标为n开始，这样就可以把值存到对象中
		//记录器
		int n=0;
		double zprice=0;
		for (int j = 0; j < i.length/5; j++) { 
			//订单详情
			OrderDetails orderDetails =new  OrderDetails();
			for (int k = n; k < n+5; k++) { 
				if(k%5==0) {
					//订单总价 totalprice
					orderDetails.setComPrice(Double.parseDouble(i[k]));
					zprice+=Double.parseDouble(i[k]);	
				}if((k-3)%5==0) {
					//商品名称
					orderDetails.setComName(i[k]);
				}
			}
			n+=5;
			//将订单详情存到集合中
			ordlist.add(orderDetails);
		}
		order.setTotalPrice(zprice*1.18);
		session.setAttribute("ordlist", ordlist);
		session.setAttribute("orders", order);
		System.out.println(ordlist);
		System.out.println(order);
		//将订单信息保存到session中
		session.setAttribute("olist",c);

		session.setAttribute("idlist",id);
		session.setAttribute("iglist",img);
		return "true";
	}
	
	//批量增加订单的方法
	@RequestMapping(value="addOrder",method=RequestMethod.POST)
	@ResponseBody
	public String addOrder(HttpSession session,@RequestParam("uphone") String uphone,
			@RequestParam("uaddress") String uaddress,@RequestParam("delivery") String delivery) {
		//取出订单信息
		String i= (String)session.getAttribute("olist");
		//取出订单id
		String id =(String)session.getAttribute("idlist");
		//取出订单img
		String ig=(String)session.getAttribute("iglist");
		//转换成数组形式
		String[] img=ig.split(",");
		String[] c=i.split(",");
		String[] o=id.split(",");
		//创建订单集合，保存订单数据
		List<Order> olists=new ArrayList<Order>();
		//创建集合，保存订单详情数据
		List<OrderDetails> odlist=new ArrayList<OrderDetails>();
		//记录器
		int n=0;
		//计算循环次数，每次循环从下标为n开始，这样就可以把值存到对象中
		for (int j = 0; j < c.length/5; j++) { 
			Order order=new Order();
			//订单详情
			OrderDetails orderDetails=new OrderDetails();
			for (int k = n; k < n+5; k++) { 
				if(k%5==0) {
					//订单总价 totalprice
					order.setTotalPrice(Double.parseDouble(c[k]));
					order.setUname(((User)session.getAttribute("loginUser")).getUname());
					order.setUphone(uphone);
					order.setUaddress(uaddress);
					order.setCreatTime(new Date());
					order.setUid(((User)session.getAttribute("loginUser")).getUid());
				}if((k-1)%5==0) {
					//产品编号 pid
					orderDetails.setPid(Integer.parseInt(c[k]));
				}if((k-2)%5==0) {
					//商品数量
					orderDetails.setComAmount(Integer.parseInt(c[k]));
				}if((k-3)%5==0) {
					//商品名称
					orderDetails.setComName(c[k]);
				}
				if((k-4)%5==0) {
					//商品价格
					orderDetails.setComPrice(Double.parseDouble(c[k]));
				}
			}
			//订单编号 oid
			ding++;
			System.out.println("自增的数"+ding);
			orderDetails.setOid(ding);
			//快递单号
			String d="";
			for (int k = 0; k <20; k++) {
				int ran2 = (int) (Math.random()*(10-1)+1);
				d+=ran2;
			}
			//订单详情图片
			System.out.println("订单详情的图片"+img[j]);
			orderDetails.setComImage(img[j]); 
			order.setCourier(delivery);
			order.setTrackNum(d);
			n+=5;
			//将订单详情存到集合中
			odlist.add(orderDetails);
			//将订单数据存到集合中
			olists.add(order);
		}
		//调用批量增加订单详情的方法
		boolean isIK=orderService.addOrderDetailsAll(odlist);
		//批量增加订单的方法
		boolean isOk=orderService.addOrderAll(olists);
		//调用批量删除购物车的方法
		boolean isCk=cartService.deleteCartAll(o);
		if(isOk) {
			if(isIK) {
				return "true";
			}else {
				return "true1";
			}
		}
		return "false";
	}
	
	//跳转到下订单页面
	@RequestMapping(value="checkout",method=RequestMethod.GET)
	public String checkout() {
		return "checkout";
	}
	
	//查询订单信息，跳转到订单页面
	@RequestMapping(value="getOrderList",method=RequestMethod.GET)
	public String getOrderList(Model model,HttpSession session) {
		int uid = ((User)session.getAttribute("loginUser")).getUid();//用户id
		if(((User)session.getAttribute("loginUser"))==null) return "login";
		List<Order> olist=orderService.getOrderList(uid);
		System.out.println(olist);
		model.addAttribute("orderSelect",olist);
		return "order";
	}
	
	//批量删除
	@RequestMapping(value="deleteOrderAll",method=RequestMethod.POST)
	@ResponseBody
	public String deleteOrderAll(@RequestParam("s") String s,HttpSession session) {
		int uid = ((User)session.getAttribute("loginUser")).getUid();//用户id
		String[] i=s.split(",");
		boolean isOk=orderService.deleteOrderAll(i,uid);
		//删除订单详情
		boolean isOid=orderDetailsService.deleteOrderDetailsAll(i);
		if(isOk) {
			return "true";
		}
		return "false";
	}
	
}
