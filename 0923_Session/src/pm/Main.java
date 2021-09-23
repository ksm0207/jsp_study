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
		
		// 응답시 한글처리
		response.setContentType("text/html; charset=UTF-8");
		
		// 응답 요청을 위한 Stream
		PrintWriter out = response.getWriter();
		
		// 접속자들마다 하나씩 가지는 Session 생성하기
		HttpSession session = request.getSession();
		
		// 로그인이 되었다면 Session에는 vo 데이터가 저장되어 있지만
		// 그렇지 않다면 vo에는 데이터가 유효하지 않는다고 봐야함.
		
		ExVO vo = (ExVO) session.getAttribute("vo");
		
		if(vo == null) {
			out.print("<a href='login.html'>[로그인]</a>");
		}else {
			out.print("<a href='Logout'>[로그아웃]</a>");
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
