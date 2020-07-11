package cn.tea.service.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.cart.OrderDetailsDao;
import cn.tea.pojo.OrderDetails;
import cn.tea.pojo.Product;
import cn.tea.service.cart.OrderDetailsService;
@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {
	@Autowired
	private OrderDetailsDao orderDetailsDao;
	public List<OrderDetails> getOrderDetailsList(int oid) {
		// TODO Auto-generated method stub
		return orderDetailsDao.getOrderDetailsList(oid);
	}
	@Override
	public boolean deleteOrderDetailsAll(String[] i) {
		int result=orderDetailsDao.deleteOrderDetailsAll(i);
		if(result>0)
		return true;
		return false;
	}
	@Override
	public Product getProductList(int pid) {
		// TODO Auto-generated method stub
		return orderDetailsDao.getProductList(pid);
	}
	@Override
	public OrderDetails getOrderDetailsPid(int oid) {
		// TODO Auto-generated method stub
		return orderDetailsDao.getOrderDetailsPid(oid);
	}


}
