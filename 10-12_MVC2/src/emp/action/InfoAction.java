package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class InfoAction implements  Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println(searchType + " / " + searchValue);
		
		EmpVO[] list = EmpDAO.getList(searchType, searchValue);
		
		request.setAttribute("list",list);
	
		return "./ex1/res.jsp";
	}

}
