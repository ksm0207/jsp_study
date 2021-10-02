package shop.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mybatis.vo.ProductVO;

public class Cart {
//  ---------------------------------------------------	
	
	// �� īƮ ��� (��ٱ���)
	
	// 1.  ��ǰ(ProductVO)�� ���� ���� ����
	// --> List<ProductVO>
	// 2. ��ǰ�� �����ϴ� ���
	// 3. ��ǰ�� �˻��ϴ� ��� -> ���� ������ ��Ҵ��� �˾ƾ��Ҷ�
	// 4. ��ǰ�� �����ϴ� ���
	// 5. (3) ��ǰ �˻� ��� : '��ǰ' �� ������ �����ϴ� ���
	// 6. ��ٱ��Ͽ� ����� �������� �迭�� ��ȯ�Ͽ� �����ִ� ���
	// 7. �Ѿ� ���
	
//  --------------------------------------------------	

//  �����ؾ��� īƮ�� �Ӽ�
	
//  - List<ProductVO>
//  - int totalPrice;	

//  - īƮ�� ��� (�޼ҵ�)	
//    - searchProduct : ��ǰ���ñ��
//	  - addProduct : ��ǰ �߰� ���
//    - delProduct : ��ǰ ���� ���
//    - changeCount : ���� ���� ��� 
//    - getList : īƮ�� �ִ� ��� ��ǰ�� �迭�� ��ȯ��
	
	private List<ProductVO> list;
	
	public Cart() {
		
		list = new ArrayList<ProductVO>();
	}
	
	// īƮ���� Ư�� ��ǰ�� �˻��ϴ� ���
	public ProductVO searchProduct(String num) {
	
		/*
		for(ProductVO pvo : list) {
			
			if(pvo.getP_num().equals(num)) {
				return pvo;
			}
		}
		return null;
		*/
		
//     �� ����� ����ϴ� �� ���� '�˻��ӵ�'�� ���̱� ���� ����� �������.
//     Iterator ����� ����Ұ����� �� ����ؾߵǴ��� ¤�� ����������.
		
//	   1- List�� �ִ� ��ü�� ã������ �ݺ����� �����	   
//     2- �̶� �˻��� ��ü�� �����ϸ� ������ �߻��� �� �ִ�.
		
//     �� �� �ΰ��� �������� �ɾ��ϱ� ����  Iterator�� �ݺ��Ͽ� List���� �������ֵ��� ����.
		
		// ���ͷ����� ����
		Iterator<ProductVO> iterator = list.iterator();
		// ���� Ŀ���� ��ġ���� ���� index �� �ִٸ� true�� ��ȯ�ϰ�
		// ������ false�� ��ȯ�Ѵ�.
		while(iterator.hasNext()) {
			// while �����ȿ��� �ݺ��ڰ� ����ĭ���� �̵��Ͽ�
			// vo�� �������ش�.
			ProductVO vo = iterator.next();
			
			if(vo.getP_num().equals(num)) {
				return vo;
			}
		}
		// ã�� ��ǰ�� ������ null�� ����.
		return null;
		
	}
	
	// īƮ�� ����� ��� ��ǰ���� �ϳ��� �迭�� ��ȯ�ϴ� ���
	public ProductVO[] getList() {
		
		ProductVO[] ar = null;
		
		if(!list.isEmpty()) {
			ar = new ProductVO[list.size()];
			
			list.toArray(ar);
			
		}
		return ar;
	}
	
	// ��ǰ�� īƮ�� �����ϴ� ���
	public void addProduct(ShopBean sb, String num) {
		// ���� ���ڷ� �Ѿ�� ���õ� ��ǰ�� ��ȣ��
		// �̹� īƮ�� ����� ��ǰ�� ���� �ֱ� ������
		// ���� īƮ���� �˻��� ���ش�.

		ProductVO vo = searchProduct(num);
		
		// ���� vo�� null�� �ƴ� ���� �ռ� īƮ�� ���� ��ǰ�� �ǹ��Ѵ�.
		// īƮ�� ���� ��ǰ�� ���� ���
		// �̶� ������ +1 ������������.
		if(vo != null) {
			// ���� ���� ��ǰ�� ������ ���ش�.
			int count = vo.getQuant();
			// �״��� +1 ���������ֱ�.
			vo.setQuant(count++);
			return;
		}else {
			// īƮ�� ���� ��ǰ�� ���� ��� 
			// �����뿡�� ��ǰ�� ����
			// �� ���� ��ǰ��ȣ�� �����뿡 �����ؾ��Ѵ�.
			sb.setP_num(num);
			vo = sb.getProduct(); // �����뿡�� ���ϴ� ��ǰ ��������
			
			// ��ǰ�� ������ 1�� �������ֱ�
			vo.setQuant(1);
			
			// īƮ�� ��´�.
			list.add(vo);
			
		}
	}	
	
	// īƮ���� Ư�� ��ǰ�� �˻��Ͽ� �����ϴ� ���
	public boolean delProduct(String num) {
		
		boolean check = false;
		
		ProductVO vo = searchProduct(num);
		
		if(vo != null) {
			list.remove(vo);
			check = true;
		}
		return check;
	}
	
	// īƮ���� ���ϴ� ��ǰ�� �˻��� �� ������ �����ϴ� ���
	public void changeCount(String num , int q) {
		
		ProductVO vo = searchProduct(num);
		if (vo != null) {
			// ������ ����Ǵ°��� �ƴ� �ѱݾ׵� ����� �� �ֱ⶧����.
			vo.setQuant(q);
		}
	}
}
