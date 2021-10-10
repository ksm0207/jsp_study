package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class CityAction implements Action {
	
	@Override
	public String getList(HttpServletRequest request , HttpServletResponse response) {
	
		request.setAttribute("seoul", "¼­¿ï");
		return "./jsp/city.jsp";
	}

}
