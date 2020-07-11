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
	//��ѯ��Ʒ��Ϣ
	@Select("SELECT * FROM tea_product ORDER BY modifyTime DESC")
	List<Product> getProductAll();
	//ģ����ѯ
	List<Product> getProductBy(@Param("pname")String pname,@Param("tid") Integer tid);
	//��ѯ��Ʒ����
	@Select("SELECT * FROM tea_producttype")
	List<ProductType> getProductTypeAll();
	//����id��ѯ��Ʒ��Ϣ
	List<Product> findByPid(@Param("pid") int pid);
	//��ѯ�ղ�
	@Select("SELECT * FROM tea_productcollect WHERE pid=#{pid} and uid=#{uid}")
	ProductCollect getCollect(@Param("pid") int pid,@Param("uid") int uid);
	//�ղ�+1
	@Update("UPDATE tea_product SET collect=collect+1 WHERE pid=#{pid} and uid=#{uid}")
	int updateCollect(@Param("pid") int pid,@Param("uid") int uid);
	//�����ղر�
	@Insert("INSERT INTO tea_productcollect(pid,uid)VALUE(#{pid},#{uid})") 
	int insertCollect(ProductCollect collect);
	//ɾ���ղر��¼
	@Delete("DELETE FROM tea_productcollect WHERE pid=#{pid} and uid=#{uid}")
	int delCollect(@Param("pid") int pid,@Param("uid") int uid);
	//���+1
	@Update("UPDATE tea_product SET view=view+1 WHERE pid=#{pid}")
	int updateView(@Param("pid") int pid);
	//��ѯ�ղ���Ϣ
	List<ProductCollect> getProCollectList();
}
