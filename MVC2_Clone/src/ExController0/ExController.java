package ExController0;

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
@WebServlet("")
public class ExController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("fruit");
		String location = "";
		
		if(param == null || param.equals("apple")) {
			request.setAttribute("apple", "사과");
			location = "./jsp/apple.jsp";
		}else if(param.equals("banana")) {
			request.setAttribute("banana", "바나나");
			location = "./jsp/banana.jsp";
		}else if(param.equals("blueberry")) {
			request.setAttribute("blueberry", "블루베리");
			location = "./jsp/blueberry.jsp";
		}
		 // request = "?" 요청할때마다  else if .. else if .. 유지보수 작업이 번거로워 진다고 생각이 든다..
		else {
			location = "./jsp/404.jsp";
		}
		
		RequestDispatcher viewPage = request.getRequestDispatcher(location);
		viewPage.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
