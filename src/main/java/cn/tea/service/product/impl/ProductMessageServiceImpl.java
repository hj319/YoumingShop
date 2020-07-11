package cn.tea.service.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.product.ProduceMessageDao;
import cn.tea.pojo.ProductMessage;
import cn.tea.service.product.ProductMessageService;
@Service
public class ProductMessageServiceImpl implements ProductMessageService {
	@Autowired
	private ProduceMessageDao messageDao;
	
	public List<ProductMessage> getMessage(int pid) {
		return messageDao.getMessage(pid);
	}
	public boolean add(ProductMessage message) {
		int isOk=messageDao.add(message);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}

}
