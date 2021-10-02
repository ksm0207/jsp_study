package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service2.Service;
import mybatis.vo.ProductVO;

public class ShopDAO {
	
	// UseBean에서 호출하는 비즈니스로직 (기능)만들어보자.
	
	// 1. 카테고리별로 검색하는 메소드
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
