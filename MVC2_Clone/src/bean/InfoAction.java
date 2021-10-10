package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class InfoAction implements Action {

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		return "./emp/emp_form.jsp";
	}

}
