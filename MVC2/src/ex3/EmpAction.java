package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex3.dao.EmpDAO;
import ex3.vo.EmpVO;

public class EmpAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		EmpVO[] ar = EmpDAO.getList();

		request.setAttribute("ar",ar);
		
		return "/ex3/page5DB.jsp";
	}

}
