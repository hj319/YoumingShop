package cn.tea.dao.cart;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
/**
 * 操作购物�?
 */
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Cart;
import cn.tea.pojo.Product;
import cn.tea.pojo.User;

@Repository
public interface CartDao {
	
	List<Cart> getCartList(@Param("uid") int uid);
	Product getComPrice(@Param("pid") int pid);
	User getUser(@Param("uid") int uid);
	
	@Insert("INSERT  INTO tea_cart (`uid`,`uname`,`pid`,`num`,`total`) "
			+ "VALUES (#{uid},#{uname},#{pid},#{num},#{total})")
	int addCart(Cart cart);
	@Update("UPDATE tea_cart SET num=#{num},total=#{total} WHERE id=#{id} AND uid=${uid}")
	int updateCart(Cart cart);

	int deleteCartAll(@Param("i") String[] i);
}
