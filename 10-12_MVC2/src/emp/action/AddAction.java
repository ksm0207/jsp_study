package emp.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.EmpDAO;

public class AddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String emp_data = request.getParameter("emp_data");
		String employee_id = request.getParameter("employee_id");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String job_id = request.getParameter("job_id");
		String hire_date = request.getParameter("hire_date");
		String department_id = request.getParameter("department_id");
		
		System.out.println("emp_data : "+emp_data);
		
		System.out.println("employee_id : " + employee_id);
		System.out.println("first_name : " + first_name);
		System.out.println("last_name : " + last_name);
		System.out.println("email : " + email);
		System.out.println("job_id : " + job_id);
		System.out.println("hire_date : " + hire_date);
		System.out.println("department_id : " + department_id);
		
	//	EmpDAO.add(employee_id, first_name, last_name, email, job_id, hire_date, department_id);
		

		return null;
	}

}
