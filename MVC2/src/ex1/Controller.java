package ex1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		/*
		 	(1) ����.
		 	
		 	type �� ���� null �̰ų� "greet" �̶��
		 	view1.jsp�� ��θ� �����ϱ�
		 	
		 	(2)
		 	
		 	�׷��� �ʰ� type�� ���� "hi"�� view2.jsp�� ��θ� �����ϱ�.
		 	 
		 * */
		
		// �� ������ ������ view�� ��θ� ������ ������ �����ϱ�.
		String viewPath = null;
		
		if(type == null || type.equals("greet")) {
			
			request.setAttribute("msg", "Controller ���� 1 ");
			viewPath = "./jsp/view1.jsp";
		}else if(type.equals("hi")) {
			request.setAttribute("str", "Controller ���� 2");
			viewPath = "./jsp/view2.jsp";
		}
		
		// MVCȯ�濡���� �� ������ �̵��� for-ward�� ��Ų��! ��
		// getRequestDispatcher ��
		RequestDispatcher req = request.getRequestDispatcher(viewPath);
		req.forward(request, response); // for-ward�� �̵��ϱ�.
		
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
