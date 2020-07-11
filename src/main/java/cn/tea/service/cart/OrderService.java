package cn.tea.service.cart;

import java.util.List;

import cn.tea.pojo.Order;
import cn.tea.pojo.OrderDetails;

public interface OrderService {
	boolean deleteAll();

	boolean addOrderAll(List<Order> olists);

	List<Order> getOrderList(int uid);

	boolean deleteOrderAll(String[] i,int uid);
	
	boolean addOrderDetailsAll(List<OrderDetails> odlist);
}
