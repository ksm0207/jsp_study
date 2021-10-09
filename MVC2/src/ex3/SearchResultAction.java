package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex3.dao.EmpDAO;
import ex3.vo.EmpVO;

public class SearchResultAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println("SearchType Data Type : "+searchType.getClass().getName());
		System.out.println("SearchValue Data Type : "+searchValue.getClass().getName());
		
		EmpVO[] vo =  EmpDAO.getSearch(searchType, searchValue);
		
		request.setAttribute("ar", vo);
		
		return "./ex3/page6_res.jsp";
	}

}
