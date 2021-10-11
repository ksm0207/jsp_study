package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.MemberDAO;

public class SignUpAction implements Action {

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		System.out.println("ID : " + id);
		System.out.println("PW : " + pw);
		System.out.println("NAME : " + name);
		System.out.println("PHONE : " + phone);
		
		MemberDAO.add(id, pw, name, phone);
		
		return "./member/login.jsp";
	}

}
