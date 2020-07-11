package cn.tea.service.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.cart.OrderDao;
import cn.tea.pojo.Order;
import cn.tea.pojo.OrderDetails;
import cn.tea.service.cart.OrderService;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;

	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean addOrderAll(List<Order> olists) {
		int result=orderDao.addOrderAll(olists);
		if(result>0) {
			return true;
		}
		return false;
	}

	public List<Order> getOrderList(int uid) {
		// TODO Auto-generated method stub
		return orderDao.getOrderList(uid);
	}

	public boolean deleteOrderAll(String[] i,int uid) {
		int result=orderDao.deleteOrderAll(i,uid);
		if(result>0) {
			return true;
		}
		return false;
	}

	public boolean addOrderDetailsAll(List<OrderDetails> odlist) {
		int result = orderDao.addOrderDetailsAll(odlist);
		if(result>0) {
			return true;
		}
		return false;
	}
}
