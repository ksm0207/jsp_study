package ex1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetAction {

//	 ���� �޼ҵ�� ��Ʈ�ѷ��� ���ؼ� ȣ��Ǹ�
//	 ���ڷ� request�� response�� �޴� ����� �˾ƺ���.
//   ��ȯ�� : View �������� ��θ� �����Ұ�.
	public String execute(HttpServletRequest request, 
			              HttpServletResponse response)
	{
		
		// ���� ��Ʈ�ѷ��� �߾��� setAttribute �۾��� ���⼭ ���ش�
		request.setAttribute("msg", "ȯ���մϴ�");
		
		return "/ex1/page1.jsp";
		
		
	}
}
