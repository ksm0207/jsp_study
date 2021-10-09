package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieAction implements Action{

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("movie", "MovieAction ! ");
		
		return "./ex3/page4.jsp";
	}
	
	

}
