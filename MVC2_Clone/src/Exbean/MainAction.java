package Exbean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class MainAction implements Action{

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		return "./jsp/main.jsp";
	}

}
