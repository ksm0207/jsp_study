package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class EmpAction implements Action {

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		
		EmpVO[] ar = EmpDAO.getAll();
		
		request.setAttribute("all", ar);
		
		return "./emp/empAll.jsp";
	}

}
