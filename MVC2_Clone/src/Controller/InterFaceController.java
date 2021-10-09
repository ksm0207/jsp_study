package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InterFaceAction;
import bean.InterFaceAction2;
import bean.NotFoundPage;
import inter.Action;

/**
 * Servlet implementation class MoveController
 */
@WebServlet("/InterFaceController")
public class InterFaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InterFaceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Action action = null;
		
		String param = request.getParameter("search");
		String location = "";
		
		if(param == null || param.equals("hello")) {
			action = new InterFaceAction(); // hello
		}else if(param.equals("bye")) {
			action = new InterFaceAction2(); // bye
		}else {
			action = new NotFoundPage();
		}
		
		location = action.getList(request, response);
		
		RequestDispatcher disp = request.getRequestDispatcher(location);
		disp.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
