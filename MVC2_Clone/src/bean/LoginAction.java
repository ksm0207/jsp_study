package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberVO mvo = MemberDAO.login(id, pw);
		
		request.setAttribute("user", mvo);
		
		return "./member/login.jsp";
	}

}
