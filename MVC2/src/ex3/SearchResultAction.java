package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex3.dao.EmpDAO;
import ex3.vo.EmpVO;

public class SearchResultAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("searchValue");
		String[] idx = request.getParameterValues("option");
		
		
		for(int i=0; i<idx.length; i++) {
			System.out.println(idx[i]);
			System.out.println("type : " + idx[i]);
			System.out.println("searchValue" + name);
		}
	
		String type = idx.toString();
		
	
		EmpVO vo = EmpDAO.search(type, name);
		
		request.setAttribute("res", vo);
		
		return "./ex3/page6_res.jsp";
	}

}
