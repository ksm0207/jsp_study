package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class SignAction implements Action{

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
	
		return "./member/sign_form.jsp";
	}
	
}
