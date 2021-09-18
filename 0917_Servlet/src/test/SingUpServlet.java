package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SingUpServlet
 */
@WebServlet("/SingUpServlet")
public class SingUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingUpServlet() {
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
		
		// Parsing(SingUp.html)�� �����κ��� �Ѿ���� �Ķ���͸� �޾Ƽ� ó���ϱ�.
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		// ���� ������ ���� ��Ʈ���� �غ�
		PrintWriter out = response.getWriter();
		
		String msg = "<h1>�̸� : " + name + " ���� : " + age + " ����ó : " + phone + " �ּ� : " + address +"</h1>" + "�׽�Ʈ�Ϸ�!";
		
		out.println(msg);
		
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
