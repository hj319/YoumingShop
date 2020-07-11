package cn.tea.dao.cart;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Order;
import cn.tea.pojo.OrderDetails;

@Repository
public interface OrderDao {
	int deleteAll();
	
	//批量增加订单的方�?
	int addOrderAll(@Param("olists") List<Order> olists);
	//查询订单的方�?
	@Select("SELECT * FROM `tea_order` WHERE uid=#{uid}")
	List<Order> getOrderList(@Param("uid") int uid);

	int deleteOrderAll(@Param("i") String[] i,@Param("uid") int uid);
	
	//批量增加订单详情的方�?
	int addOrderDetailsAll(@Param("odlist") List<OrderDetails> odlist);
}
