package ex1;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class DateAction {
	
	public static String getNowDate(HttpServletRequest request , HttpServletResponse response)
	{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String res = sdf.format(date);
		
		request.setAttribute("now", res);
		
		return  "/ex1/nowPage.jsp";
	}

}
