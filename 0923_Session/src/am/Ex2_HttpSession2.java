package am;

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
 * Servlet implementation class Ex2_HttpSession2
 */
@WebServlet("/Ex2_HttpSession2")
public class Ex2_HttpSession2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex2_HttpSession2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HttpSession을 얻어주기.
		HttpSession session = request.getSession();
		
		// 세션에서 저장된 값을 각각 얻어내기
		response.setContentType("text/html; charset=UTF-8");
		
		ExVO  vo = (ExVO) session.getAttribute("user");
	
		PrintWriter out = response.getWriter();
		
		if(vo != null) {
			
			out.print("<h2>ID : " + vo.getUser_id() + "</h2>");
			out.print("<h2>Name : " + vo.getUser_name() + "</h2>");
			out.print("<h2>Email : " + vo.getEmail() + "</h2>");
		}
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
