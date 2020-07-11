package cn.tea.dao.product;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Product;
import cn.tea.pojo.ProductCollect;
import cn.tea.pojo.ProductType;
@Repository
public interface ProductDao {
	//查询商品信息
	@Select("SELECT * FROM tea_product ORDER BY modifyTime DESC")
	List<Product> getProductAll();
	//模糊查询
	List<Product> getProductBy(@Param("pname")String pname,@Param("tid") Integer tid);
	//查询商品分类
	@Select("SELECT * FROM tea_producttype")
	List<ProductType> getProductTypeAll();
	//根据id查询商品信息
	List<Product> findByPid(@Param("pid") int pid);
	//查询收藏
	@Select("SELECT * FROM tea_productcollect WHERE pid=#{pid} and uid=#{uid}")
	ProductCollect getCollect(@Param("pid") int pid,@Param("uid") int uid);
	//收藏+1
	@Update("UPDATE tea_product SET collect=collect+1 WHERE pid=#{pid} and uid=#{uid}")
	int updateCollect(@Param("pid") int pid,@Param("uid") int uid);
	//加入收藏表
	@Insert("INSERT INTO tea_productcollect(pid,uid)VALUE(#{pid},#{uid})") 
	int insertCollect(ProductCollect collect);
	//删除收藏表记录
	@Delete("DELETE FROM tea_productcollect WHERE pid=#{pid} and uid=#{uid}")
	int delCollect(@Param("pid") int pid,@Param("uid") int uid);
	//浏览+1
	@Update("UPDATE tea_product SET view=view+1 WHERE pid=#{pid}")
	int updateView(@Param("pid") int pid);
	//查询收藏信息
	List<ProductCollect> getProCollectList();
}
