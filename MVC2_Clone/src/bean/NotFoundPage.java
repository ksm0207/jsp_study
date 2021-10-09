package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class NotFoundPage implements Action {

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "./jsp/404.jsp";
	}
	
	
}
