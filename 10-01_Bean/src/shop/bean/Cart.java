package shop.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mybatis.vo.ProductVO;

public class Cart {
//  ---------------------------------------------------	
	
	// ※ 카트 기능 (장바구니)
	
	// 1.  제품(ProductVO)을 담을 저장 공간
	// --> List<ProductVO>
	// 2. 제품을 저장하는 기능
	// 3. 제품을 검색하는 기능 -> 내가 무엇을 담았는지 알아야할때
	// 4. 제품을 삭제하는 기능
	// 5. (3) 제품 검색 결과 : '제품' 의 수량을 변경하는 기능
	// 6. 장바구니에 담겨진 아이템을 배열로 반환하여 보여주는 기능
	// 7. 총액 계산
	
//  --------------------------------------------------	

//  구현해야할 카트의 속성
	
//  - List<ProductVO>
//  - int totalPrice;	

//  - 카트의 기능 (메소드)	
//    - searchProduct : 제품선택기능
//	  - addProduct : 제품 추가 기능
//    - delProduct : 제품 삭제 기능
//    - changeCount : 수량 변경 기능 
//    - getList : 카트에 있는 모든 제품을 배열로 반환함
	
	private List<ProductVO> list;
	
	public Cart() {
		
		list = new ArrayList<ProductVO>();
	}
	
	// 카트에서 특정 제품을 검색하는 기능
	public ProductVO searchProduct(String num) {
	
		/*
		for(ProductVO pvo : list) {
			
			if(pvo.getP_num().equals(num)) {
				return pvo;
			}
		}
		return null;
		*/
		
//     위 방법을 사용하는 것 보다 '검색속도'를 높이기 위한 방법을 사용하자.
//     Iterator 방법을 사용할거지만 왜 사용해야되는지 짚고 가도록하자.
		
//	   1- List에 있는 객체를 찾기위해 반복문을 사용함	   
//     2- 이때 검색된 객체를 삭제하면 오류가 발생할 수 있다.
		
//     ※ 위 두가지 문제점을 케어하기 위해  Iterator를 반복하여 List에서 삭제해주도록 하자.
		
		// 이터레이터 선언
		Iterator<ProductVO> iterator = list.iterator();
		// 현재 커서의 위치에서 다음 index 가 있다면 true를 반환하고
		// 없으면 false를 반환한다.
		while(iterator.hasNext()) {
			// while 영역안에는 반복자가 다음칸으로 이동하여
			// vo에 저장해준다.
			ProductVO vo = iterator.next();
			
			if(vo.getP_num().equals(num)) {
				return vo;
			}
		}
		// 찾는 제품이 없으면 null로 빠짐.
		return null;
		
	}
	
	// 카트에 저장된 모든 제품들을 하나의 배열로 반환하는 기능
	public ProductVO[] getList() {
		
		ProductVO[] ar = null;
		
		if(!list.isEmpty()) {
			ar = new ProductVO[list.size()];
			
			list.toArray(ar);
			
		}
		return ar;
	}
	
	// 제품을 카트에 저장하는 기능
	public void addProduct(ShopBean sb, String num) {
		// 현재 인자로 넘어온 선택된 제품의 번호가
		// 이미 카트에 저장된 제품일 수도 있기 때문에
		// 먼저 카트에서 검색을 해준다.

		ProductVO vo = searchProduct(num);
		
		// 위의 vo가 null이 아닐 경우는 앞서 카트에 담은 제품을 의미한다.
		// 카트에 같은 제품이 없는 경우
		// 이때 수량만 +1 증가시켜주자.
		if(vo != null) {
			// 먼저 기존 제품의 수량을 얻어내준다.
			int count = vo.getQuant();
			// 그다음 +1 증가시켜주기.
			vo.setQuant(count++);
			return;
		}else {
			// 카트에 같은 제품이 없는 경우 
			// 진열대에서 제품을 얻어낸다
			// ※ 먼저 제품번호를 진열대에 저장해야한다.
			sb.setP_num(num);
			vo = sb.getProduct(); // 진열대에서 원하는 제품 가져오기
			
			// 제품의 수량을 1로 지정해주기
			vo.setQuant(1);
			
			// 카트에 담는다.
			list.add(vo);
			
		}
	}	
	
	// 카트에서 특정 제품을 검색하여 삭제하는 기능
	public boolean delProduct(String num) {
		
		boolean check = false;
		
		ProductVO vo = searchProduct(num);
		
		if(vo != null) {
			list.remove(vo);
			check = true;
		}
		return check;
	}
	
	// 카트에서 원하는 제품을 검색한 후 수량만 변경하는 기능
	public void changeCount(String num , int q) {
		
		ProductVO vo = searchProduct(num);
		if (vo != null) {
			// 수량만 변경되는것이 아닌 총금액도 변경될 수 있기때문임.
			vo.setQuant(q);
		}
	}
}
