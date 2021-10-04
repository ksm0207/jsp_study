package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 2. 제품등록기능 메소드
	
	/*
	  	select - String
	  	p_num - String
	  	p_name - String
	  	p_com - String
	  	p_price - String
	  	p_content - String
	  	p_img - String
	 
	 * */
	
	public static int createProduct(String category, 
									String p_num,
									String p_name, 
									String p_company,
									String p_price,
									String p_saleprice,
									String p_content, 
									String p_image_s)
	{
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("category",category);
		map.put("p_num",p_num);
		map.put("p_name",p_name);
		map.put("p_company",p_company);
		map.put("p_price",p_price);
		// salePrice
		map.put("p_saleprice",p_saleprice);
		map.put("p_image_s",p_image_s);
		// add p_image_l
		map.put("p_content",p_content);
		
		SqlSession session = Service.getFactory().openSession();
		
		int res = session.insert("shop.add",map);
		
		if(res > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		
		
		return res;
	}
	
}
