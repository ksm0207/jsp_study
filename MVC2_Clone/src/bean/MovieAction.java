package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieAction {
	
	public String getList(HttpServletRequest request , HttpServletResponse response) {
		
		request.setAttribute("movie", "Movie");
		
		return "./jsp/movie.jsp";
	}

}
