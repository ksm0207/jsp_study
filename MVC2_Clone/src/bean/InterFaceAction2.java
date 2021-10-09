package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class InterFaceAction2 implements Action{

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("bye", "InterFaceAction2 - Bye !");
		
		return "./jsp/bye.jsp";
	}

}
