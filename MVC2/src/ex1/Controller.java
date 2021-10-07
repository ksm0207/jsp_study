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
		 	(1) 연습.
		 	
		 	type 의 값이 null 이거나 "greet" 이라면
		 	view1.jsp로 경로를 지정하기
		 	
		 	(2)
		 	
		 	그렇지 않고 type의 값이 "hi"면 view2.jsp로 경로를 지정하기.
		 	 
		 * */
		
		// 위 조건을 가지고 view의 경로를 저장할 변수를 선언하기.
		String viewPath = null;
		
		if(type == null || type.equals("greet")) {
			
			request.setAttribute("msg", "Controller 연습 1 ");
			viewPath = "./jsp/view1.jsp";
		}else if(type.equals("hi")) {
			request.setAttribute("str", "Controller 연습 2");
			viewPath = "./jsp/view2.jsp";
		}
		
		// MVC환경에서는 뷰 페이지 이동은 for-ward를 시킨다! ★
		// getRequestDispatcher ★
		RequestDispatcher req = request.getRequestDispatcher(viewPath);
		req.forward(request, response); // for-ward로 이동하기.
		
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
