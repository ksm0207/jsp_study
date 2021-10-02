package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service2.Service;
import mybatis.vo.ProductVO;

public class ShopDAO {
	
	// UseBean���� ȣ���ϴ� ����Ͻ����� (���)������.
	
	// 1. ī�װ����� �˻��ϴ� �޼ҵ�
	public static ProductVO[] getList(String category) {
		ProductVO[] arr = null;
		SqlSession session = Service.getFactory().openSession();
			
		List<ProductVO> list = session.selectList("shop.list",category);
		
		if(list != null && list.size() > 0 && !list.isEmpty()) {
			
			arr = new ProductVO[list.size()];
			
			list.toArray(arr);
			
		}
		session.close();
		return arr;
	}
}
