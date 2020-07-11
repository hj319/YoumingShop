package cn.tea.service.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.cart.CartDao;
import cn.tea.pojo.Cart;
import cn.tea.pojo.Product;
import cn.tea.pojo.User;
import cn.tea.service.cart.CartService;
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;
	public List<Cart> getCartList(int uid) {
		// TODO Auto-generated method stub
		return cartDao.getCartList(uid);
	}

	public boolean addCart(Cart cart) {
		int result=cartDao.addCart(cart);
		if(result>0) {
			return true;
		}
		return false;
	}

	public boolean updateCart(Cart cart) {
		int result=cartDao.updateCart(cart);
		if(result>0) {
			return true;
		}
		return false;
	}

	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}

	public Product getComPrice(int pid) {
		// TODO Auto-generated method stub
		return cartDao.getComPrice(pid);
	}

	public User getUser(int uid) {
		// TODO Auto-generated method stub
		return cartDao.getUser(uid);
	}

	public boolean deleteCartAll(String[] i) {
		int result = cartDao.deleteCartAll(i);
		if(result>0) {
			return true;
		}
		return false;
	}
}
