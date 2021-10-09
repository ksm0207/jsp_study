package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("str", "Hello World !!");
		return "./ex3/page3.jsp";
	}

}
