package mybatis.vo;

public class ProductVO {

	private String num; // 기본키
	private String category; // 카테고리
	private String p_num; // 제품번호
	private String p_name; // 제품이름
	private String p_company; // 제조회사
	private String p_image_s; // 작은이미지(썸네일)
	private String p_image_l; // 제품이미지(제품이미지 상세보기)
	private String p_content; // 제품 설명
	private String p_date; // 제품 등록날짜
	
	private int p_price; // 제품가격
	private int p_saleprice; // 할인가격
	private int quant; // 수량
	private int totalPrice; // 총액
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public String getP_image_s() {
		return p_image_s;
	}
	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}
	public String getP_image_l() {
		return p_image_l;
	}
	public void setP_image_l(String p_image_l) {
		this.p_image_l = p_image_l;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}
	public int getQuant() {
		return quant;
	}
	
	// 수량이 변경될때 자동적으로 총액을 다시구해져야함!
	// 수량 * 세일가격
	public void setQuant(int quant) {
		
		// 1번방법 setTotalPrice(quant * p_saleprice);
		// 2번방법 totalPrice = quant * p_saleprice;
		
		this.quant = quant;
		setTotalPrice(quant * p_saleprice);
		
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	// 할인률 구하는 메소드
	// 실무에서는 BigDecimal 객체를 사용함. 주식거래에서 사용될 수 있으며
	// 특히 수익률 구할때 활용함.
	public int getPercent() {
		
		float per = (p_price - p_saleprice) * 100 / p_price;
		
		int value = (int)per; // 소수점 자르기
		
		return value;
	}
	
	
	
	
}
