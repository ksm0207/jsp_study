package am;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginHttpSession
 */
@WebServlet("/LoginHttp")
public class LoginHttp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginHttp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청시 한글 처리 해주는 메소드
		request.setCharacterEncoding("UTF-8");
		// 응답시 한글 처리 해주는 메소드
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		/* DB 작업 구간.. 오전 pass */
		System.out.println(id + " " + pw);
		
		// Session 얻기
		HttpSession session = request.getSession();
		
		// Session 저장하기 - KEY & VALUE
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", "Kimsungmin");
		
//		HttpSession에 값을 저장하는 내용을 살펴보면 Map구조와 유사함.
		
		// 응답을 위한 Stream
		PrintWriter out = response.getWriter();
		
		out.print("<h2Save</h2>");
		out.print("<script> location.href='Ex1_HttpSession2'</script>");
//		out.print("<a href= 'Ex1_HttpSession2'>다음 서블릿</a>");
		
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
