package bean;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.MemberDAO;

public class CheckID implements Action{

	@Override
	public String getList(HttpServletRequest request, HttpServletResponse response) {
		
		return "./member/id_check.jsp";
	}
	
	

}
