package ex1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction {
	
	public String hello(HttpServletRequest req , HttpServletResponse res) {
		
		req.setAttribute("str", "Hello World !!");
		
		return "./ex1/page3.jsp";
	}

}
