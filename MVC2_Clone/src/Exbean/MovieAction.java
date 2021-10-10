package Exbean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class MovieAction implements Action {
	
	@Override
	public String getList(HttpServletRequest request , HttpServletResponse response) {
		
		request.setAttribute("movie", "Movie");
		
		return "./jsp/movie.jsp";
	}

}
