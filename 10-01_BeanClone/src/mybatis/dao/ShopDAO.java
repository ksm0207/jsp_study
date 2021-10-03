package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.ProductVO;

public class ShopDAO {

	
	//useBean에서 호출하는 비지니스 로직(기능)
	public static ProductVO[] getList(String category) {
		ProductVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("shop.list", category);
		
		if(list != null && list.size() > 0 && !list.isEmpty()) {
			ar = new ProductVO[list.size()];
			
			//리스트의 요소들을 배열에 복사
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
}
