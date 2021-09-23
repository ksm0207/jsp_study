package am;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginHttpSession
 */
@WebServlet("/LoginHttp")
public class LoginHttp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginHttp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ��û�� �ѱ� ó�� ���ִ� �޼ҵ�
		request.setCharacterEncoding("UTF-8");
		// ����� �ѱ� ó�� ���ִ� �޼ҵ�
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		/* DB �۾� ����.. ���� pass */
		System.out.println(id + " " + pw);
		
		// Session ���
		HttpSession session = request.getSession();
		
		// Session �����ϱ� - KEY & VALUE
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", "Kimsungmin");
		
//		HttpSession�� ���� �����ϴ� ������ ���캸�� Map������ ������.
		
		// ������ ���� Stream
		PrintWriter out = response.getWriter();
		
		out.print("<h2Save</h2>");
		out.print("<script> location.href='Ex1_HttpSession2'</script>");
//		out.print("<a href= 'Ex1_HttpSession2'>���� ����</a>");
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
