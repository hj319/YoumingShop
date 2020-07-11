package cn.tea.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tea.pojo.BlogCollect;
import cn.tea.pojo.Product;
import cn.tea.pojo.ProductCollect;
import cn.tea.pojo.ProductType;

public interface ProductService {
	//查询商品信息
		List<Product> getProductAll();
	//模糊查询
	List<Product> getProductBy(String pname,Integer tid);
	//查询商品分类
	List<ProductType> getProductTypeAll();
	//根据id查询商品信息
	List<Product> findByPid(int pid);
	//查询收藏
	ProductCollect getCollect(int pid,int uid);
	//收藏+1
	boolean updateCollect(int pid,int uid);
	//加入收藏表
	boolean insertCollect(ProductCollect collect);
	//删除收藏表记录
	boolean delCollect(int pid,int uid);
	//浏览+1
	boolean updateView(int pid);
	//查询收藏信息
	List<ProductCollect> getProCollectList();
}
