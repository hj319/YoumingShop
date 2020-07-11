package cn.tea.service.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tea.pojo.Cart;
import cn.tea.pojo.Product;
import cn.tea.pojo.User;

public interface CartService {
	List<Cart> getCartList(int uid);
	User getUser(int uid);
	Product getComPrice(int pid);
	
	boolean addCart(Cart cart);
	
	boolean updateCart(Cart cart);
	
	boolean delete();
	boolean deleteCartAll(String[] i);
	
	
}
