package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class InterFaceAction implements Action {

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("hello", "InterFace Action - Hello !");
		
		return "./jsp/hello.jsp";
		
	}

}
