package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {
	
	// ����ڰ� �����ϴ� ī�װ� '��' �ڷ����� jsp ���Ͽ��� ó�����ش�
	// setProperty ����
	private String category;
	
	
	// ProductVO ��ü�� �迭�� ������.
	// 1- ī�װ� ������ ��ǰ���� �����Ȱ��� �迭�� �����ϱ�
	// 2- ����ڰ� ������ ��ǰ���� ����� ��ȯ�Ѵ�.
	// 3- �������� �����ϸ� ���õ� �����۸���� �迭�� �����.
	// 4- p_list�� 1,2,3 �� �����ϰ� ȭ�鿡 ������ ��������.
	private ProductVO[] p_list;
	
	// ��ǰ �󼼺��� ��ɿ��� �޴� ��ǰ��ȣ�� ������ ���� ����
	private String p_num;
	
	// �� ��ǰ ����� ShopDAO�� ���� �������ش�.
	// �� �� �޼ҵ�� ��ǰ�� �˻��ϱ� ���� �޼ҵ�.
	public void searchProduct() {
		
		// �Ʒ� DAO�� ���� ī�װ��� ä���ֵ��� ����.
		// �� �� ����� ȭ�鿡 �ѷ��ָ��!	
		p_list = ShopDAO.getList(category); // DAO�� ���� �� �ְ� ������� ���
	
	}
	
	// ����ڰ� �󼼺��⸦ �ϱ� ���� ��ǰ��ȣ�� �̿��ϰ� ��
	// �� : ��ǰ : '�ڵ���' Ŭ�� �� �ڵ����� �󼼸���� �˻��� ��ǰ��ȣ�� ��ȯ�ؾ���
	public ProductVO getProduct() {
		ProductVO vo = null;
		
		// p_list���� ������� p_num���� ��ǰ�� �˻�������
		
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
