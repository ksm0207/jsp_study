package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CityAction {
	
	public String getList(HttpServletRequest request , HttpServletResponse response) {
	
		request.setAttribute("seoul", "����");
		return "./jsp/city.jsp";
	}

}
