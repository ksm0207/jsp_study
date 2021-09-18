package hobby;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EX5
 */
@WebServlet("/EX5")
public class EX5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EX5() {
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
		
		String[] friend = request.getParameterValues("f_name");
		PrintWriter print = response.getWriter();
		
		print.println("<h1>ģ�����</br>");
		
		for(String res : friend) {
			print.println(res);
		}
		print.close();
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
