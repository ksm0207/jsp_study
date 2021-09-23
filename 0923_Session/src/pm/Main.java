package pm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ExVO;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ����� �ѱ�ó��
		response.setContentType("text/html; charset=UTF-8");
		
		// ���� ��û�� ���� Stream
		PrintWriter out = response.getWriter();
		
		// �����ڵ鸶�� �ϳ��� ������ Session �����ϱ�
		HttpSession session = request.getSession();
		
		// �α����� �Ǿ��ٸ� Session���� vo �����Ͱ� ����Ǿ� ������
		// �׷��� �ʴٸ� vo���� �����Ͱ� ��ȿ���� �ʴ´ٰ� ������.
		
		ExVO vo = (ExVO) session.getAttribute("vo");
		
		if(vo == null) {
			out.print("<a href='login.html'>[�α���]</a>");
		}else {
			out.print("<a href='Logout'>[�α׾ƿ�]</a>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
