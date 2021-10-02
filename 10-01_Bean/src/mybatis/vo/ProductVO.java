package mybatis.vo;

public class ProductVO {

	private String num; // �⺻Ű
	private String category; // ī�װ�
	private String p_num; // ��ǰ��ȣ
	private String p_name; // ��ǰ�̸�
	private String p_company; // ����ȸ��
	private String p_image_s; // �����̹���(�����)
	private String p_image_l; // ��ǰ�̹���(��ǰ�̹��� �󼼺���)
	private String p_content; // ��ǰ ����
	private String p_date; // ��ǰ ��ϳ�¥
	
	private int p_price; // ��ǰ����
	private int p_saleprice; // ���ΰ���
	private int quant; // ����
	private int totalPrice; // �Ѿ�
	
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
	
	// ������ ����ɶ� �ڵ������� �Ѿ��� �ٽñ���������!
	// ���� * ���ϰ���
	public void setQuant(int quant) {
		
		// 1����� setTotalPrice(quant * p_saleprice);
		// 2����� totalPrice = quant * p_saleprice;
		
		this.quant = quant;
		setTotalPrice(quant * p_saleprice);
		
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	// ���η� ���ϴ� �޼ҵ�
	// �ǹ������� BigDecimal ��ü�� �����. �ֽİŷ����� ���� �� ������
	// Ư�� ���ͷ� ���Ҷ� Ȱ����.
	public int getPercent() {
		
		float per = (p_price - p_saleprice) * 100 / p_price;
		
		int value = (int)per; // �Ҽ��� �ڸ���
		
		return value;
	}
	
	
	
	
}
