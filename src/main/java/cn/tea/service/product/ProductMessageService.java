package cn.tea.service.product;

import java.util.List;

import cn.tea.pojo.ProductMessage;

public interface ProductMessageService {
	List<ProductMessage> getMessage(int pid);
	
	boolean add(ProductMessage message);
}
