package cn.tea.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tea.pojo.OrderDetails;
import cn.tea.pojo.Product;
import cn.tea.service.cart.OrderDetailsService;

@Controller
@RequestMapping("/orderdetails")
public class OrderDetailsController {
	@Autowired
	private OrderDetailsService orderDetailsService;
	
	//获取订单详情的方法
	@RequestMapping(value="getOrderDetailsList",method=RequestMethod.GET)
	public String getOrderDetailsList(@RequestParam("oid") int oid,HttpSession session) {
		//保存订单详情 
				List<OrderDetails> dlist=orderDetailsService.getOrderDetailsList(oid);
				System.out.println(dlist);
				session.setAttribute("dlist", dlist);
				//查询产品id
				OrderDetails ordds=orderDetailsService.getOrderDetailsPid(oid);
				int pid=ordds.getPid();
				System.out.println(ordds);
				//，获取产品简介
				Product odproduct = orderDetailsService.getProductList(pid);
				session.setAttribute("odproduct", odproduct);
				return "order-single";
	}
}
