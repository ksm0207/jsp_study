package ex3;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class DateAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String res = sdf.format(date);
		
		request.setAttribute("now", res);
		
		return  "/ex3/page2.jsp";
		
	}

}
