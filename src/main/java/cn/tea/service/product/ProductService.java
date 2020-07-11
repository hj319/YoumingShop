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
	//��ѯ��Ʒ��Ϣ
		List<Product> getProductAll();
	//ģ����ѯ
	List<Product> getProductBy(String pname,Integer tid);
	//��ѯ��Ʒ����
	List<ProductType> getProductTypeAll();
	//����id��ѯ��Ʒ��Ϣ
	List<Product> findByPid(int pid);
	//��ѯ�ղ�
	ProductCollect getCollect(int pid,int uid);
	//�ղ�+1
	boolean updateCollect(int pid,int uid);
	//�����ղر�
	boolean insertCollect(ProductCollect collect);
	//ɾ���ղر��¼
	boolean delCollect(int pid,int uid);
	//���+1
	boolean updateView(int pid);
	//��ѯ�ղ���Ϣ
	List<ProductCollect> getProCollectList();
}
