package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {
	
	// 사용자가 선택하는 카테고리 '값' 자료형은 jsp 파일에서 처리해준다
	// setProperty 참고
	private String category;
	
	
	// ProductVO 객체를 배열로 관리함.
	// 1- 카테고리 값으로 제품들을 선별된것을 배열로 관리하기
	// 2- 사용자가 선택한 제품들의 목록을 반환한다.
	// 3- 아이템을 선택하면 관련된 아이템목록을 배열로 담아줌.
	// 4- p_list로 1,2,3 을 관리하고 화면에 보여줄 변수가됨.
	private ProductVO[] p_list;
	
	// 제품 상세보기 기능에서 받는 제품번호를 가지기 위한 변수
	private String p_num;
	
	// ※ 제품 목록을 ShopDAO를 통해 생성해준다.
	// ※ 이 메소드는 제품을 검색하기 위한 메소드.
	public void searchProduct() {
		
		// 아래 DAO를 통해 카테고리를 채워주도록 하자.
		// 그 후 목록을 화면에 뿌려주면됨!	
		p_list = ShopDAO.getList(category); // DAO를 통해 값 넣고 쿼리결과 담기
	
	}
	
	// 사용자가 상세보기를 하기 위해 제품번호를 이용하게 됨
	// 예 : 상품 : '핸드폰' 클릭 시 핸드폰의 상세목록을 검색후 제품번호를 반환해야함
	public ProductVO getProduct() {
		ProductVO vo = null;
		
		// p_list에서 멤버변수 p_num으로 제품을 검색해주자
		
		for(ProductVO pvo : p_list) {
			
			if(pvo.getP_num().equals(p_num)) {
				vo = pvo;
				break;
			}
		}
		
		return vo;
	}

	
	// getter / setter 
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public ProductVO[] getP_list() {
		return p_list;
	}

	public void setP_list(ProductVO[] p_list) {
		this.p_list = p_list;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	
}
