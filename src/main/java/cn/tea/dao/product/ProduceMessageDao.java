package cn.tea.dao.product;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.ProductMessage;

@Repository
public interface ProduceMessageDao {
	//��ѯ��Ʒ������
	List<ProductMessage> getMessage(@Param("pid")int pid);
	//������Ʒ����
	@Insert("INSERT INTO tea_productmessage(pid,uid,mcontent)VALUE(#{pid},#{uid},#{mcontent})")
	int add(ProductMessage message);
}
