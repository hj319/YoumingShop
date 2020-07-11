package cn.tea.dao.cart;


import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.OrderDetails;
import cn.tea.pojo.Product;

@Repository
public interface OrderDetailsDao {
	List<OrderDetails> getOrderDetailsList(@Param("oid") int oid);

	int deleteOrderDetailsAll(@Param("i") String[] i);

	@Select("SELECT * FROM `tea_product` WHERE pid=#{pid}")
	Product getProductList(@Param("pid") int pid);

	@Select("SELECT od.pid FROM `tea_order_details` od WHERE oid=#{oid}")
	OrderDetails getOrderDetailsPid(int oid);


	
}
