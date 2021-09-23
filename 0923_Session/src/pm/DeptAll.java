package pm;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.sql.SQLFeatureNotSupportedException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import vo.EmpVO;

/**
 * Servlet implementation class EmpAll
 */

@WebServlet("/DeptAll")
public class DeptAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Script 호출(dept)");
		
		SqlSessionFactory factory = null;
		try {
			
			Reader reader = Resources.getResourceAsReader("config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();	
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		SqlSession sql = factory.openSession();
		
		String dept_id = request.getParameter("dept_id");
		
		List<EmpVO> evo_list = sql.selectList("emp.dept_id",dept_id);
		
		System.out.println("사용자 입력한 부서코드 : " + dept_id);
		
		StringBuffer sb = new StringBuffer();
		
		for (EmpVO evo : evo_list ) {
			sb.append("<tr>");
			
			sb.append("<td>");
			sb.append(evo.getEmployee_id());
			sb.append("</td>");
			
			sb.append("<td>");
			sb.append(evo.getFirst_name());
			sb.append("</td>");
			
			
			
			sb.append("<td>");
			sb.append(evo.getJob_id());
			sb.append("</td>");
			
			sb.append("<td>");
			sb.append(evo.getDepartment_id());
			sb.append("</td>");
			
			sb.append("</tr>");
		}
		out.print(sb.toString());
		out.close();
		sql.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
