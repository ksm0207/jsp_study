
public class Page {
	public static void main(String[] args) {
		
		int nowPage = 1;
		int numPerPage = 10;
		
		int totalRecord = 21;
		
		int total = 0;
		
		total = (int)Math.ceil((double) totalRecord / numPerPage);
		
		System.out.println("��ü ������ �� : "+total);
		
		int begin = (nowPage-1) * numPerPage + 1;
		
		System.out.println("������ ù ���� : " + begin);
		
		int end = nowPage - numPerPage;
		
		System.out.println("�������� ������ " + end);
		
		
	}
}
