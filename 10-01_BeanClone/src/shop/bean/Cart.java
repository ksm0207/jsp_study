package shop.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mybatis.vo.ProductVO;

public class Cart {
	
	// t
	
	private List<ProductVO> list;
	public Cart() { 
		list = new ArrayList<ProductVO>();
	}
	
	
	public ProductVO searchProduct(String pnum) {
		
		Iterator<ProductVO> it = list.iterator();
		
		while(it.hasNext()) { 
			ProductVO vo = it.next();
			
			if(vo.getP_num().equals(pnum))
				return vo;
			
		}
		return null;
	}
	
	
	public ProductVO[] getList() {
		ProductVO[] ar = null;
		if(!list.isEmpty()) {
			ar = new ProductVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	
	
	public void addProduct(ShopBean sb, String pnum) {
		
		ProductVO vo = searchProduct(pnum);
		
		
		if(vo != null) {
		
			int q = vo.getQuant();
			vo.setQuant(q+1);
			return; 
		}
		
		
		sb.setP_num(pnum);
		vo = sb.getProduct(); 
		
		
		vo.setQuant(1);
		
		
		list.add(vo);
	}
	
	
	public boolean delProduct(String pnum) {
		boolean value = false;
		ProductVO vo = searchProduct(pnum);
		if(vo != null) {
			list.remove(vo);//�궘�젣!!!
			value = true;
		}
		
		return value;
	}
	

	public void changeCount(String pnum, int q) {
		ProductVO vo = searchProduct(pnum);
		if(vo != null)
			vo.setQuant(q);
	}
}










