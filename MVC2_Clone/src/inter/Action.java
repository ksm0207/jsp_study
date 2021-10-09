package inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	public String getList(HttpServletRequest request , HttpServletResponse response);
}
