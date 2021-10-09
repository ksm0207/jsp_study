package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CityAction;
import bean.MovieAction;

/**
 * Servlet implementation class BeanController
 */
@WebServlet("/BeanController")
public class BeanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String param = request.getParameter("search");
		String location = "";
		
		if(param == null || param.equals("seoul")) {
			CityAction city = new CityAction();
			location = city.getList(request, response);
			System.out.println(location);
		}else if (param.equals("movie")) {
			MovieAction movie = new MovieAction();
			location = movie.getList(request, response);
		}
		// ExController 와 다른건 Bean 객체를 사용한거지만
		// 흐름은 똑같다..
		
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
