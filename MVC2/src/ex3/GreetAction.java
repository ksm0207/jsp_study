package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetAction  implements Action{

//	 현재 메소드는 컨트롤러에 의해서 호출되며
//	 인자로 request와 response를 받는 방법을 알아보자.
//   반환형 : View 페이지의 경로를 리턴할것.
	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 어제 컨트롤러에 했었던 setAttribute 작업을 여기서 해준다
				request.setAttribute("msg", "환영합니다");
				
				return "/ex3/page1.jsp";
		
	}
}
