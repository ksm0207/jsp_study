package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetAction  implements Action{

//	 ���� �޼ҵ�� ��Ʈ�ѷ��� ���ؼ� ȣ��Ǹ�
//	 ���ڷ� request�� response�� �޴� ����� �˾ƺ���.
//   ��ȯ�� : View �������� ��θ� �����Ұ�.
	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// ���� ��Ʈ�ѷ��� �߾��� setAttribute �۾��� ���⼭ ���ش�
				request.setAttribute("msg", "ȯ���մϴ�");
				
				return "/ex3/page1.jsp";
		
	}
}
