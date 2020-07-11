package cn.tea.service.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.product.ProductDao;
import cn.tea.pojo.BlogCollect;
import cn.tea.pojo.Product;
import cn.tea.pojo.ProductCollect;
import cn.tea.pojo.ProductType;
import cn.tea.service.product.ProductService;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;
	
	//查询商品信息
	public List<Product> getProductAll() {
		return productDao.getProductAll();
	}
	//模糊查询
	public List<Product> getProductBy(String pname, Integer tid) {
		return productDao.getProductBy(pname, tid);
	}
	//查询商品分类
	public List<ProductType> getProductTypeAll() {
		return productDao.getProductTypeAll();
	}
	//根据id查询商品信息
	public List<Product> findByPid(int pid) {
		return productDao.findByPid(pid);
	}
	public boolean updateCollect(int pid,int uid) {
		int isOk=productDao.updateCollect(pid,uid);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	
	public ProductCollect getCollect(int pid,int uid) {
		return productDao.getCollect(pid,uid);
	}
	
	public boolean insertCollect(ProductCollect collect) {
		int isOk=productDao.insertCollect(collect);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public boolean delCollect(int pid,int uid) {
		int isOk=productDao.delCollect(pid,uid);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public boolean updateView(int pid) {
		int isOk=productDao.updateView(pid);
		if(isOk>0) {
			return true;
		}else {
		return false;
		}
	}
	public List<ProductCollect> getProCollectList() {
		return productDao.getProCollectList();
	}
}
