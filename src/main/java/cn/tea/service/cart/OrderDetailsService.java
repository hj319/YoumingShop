package cn.tea.service.cart;

import java.util.List;

import cn.tea.pojo.OrderDetails;
import cn.tea.pojo.Product;

public interface OrderDetailsService {
	List<OrderDetails> getOrderDetailsList(int oid);

	boolean deleteOrderDetailsAll(String[] i);

	OrderDetails getOrderDetailsPid(int oid);

	Product getProductList(int pid);
}
