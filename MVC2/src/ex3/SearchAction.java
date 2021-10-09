package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex3.dao.EmpDAO;
import ex3.vo.EmpVO;

public class SearchAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {

		return "./ex3/page6.jsp";
	
	}

}
