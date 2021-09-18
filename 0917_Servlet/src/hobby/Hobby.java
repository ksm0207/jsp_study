package hobby;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hobby
 */

@WebServlet("/Hobby")
public class Hobby extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hobby() {
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
		
		String name = request.getParameter("name");
		String[] hobby = request.getParameterValues("hobby");
		
		
		System.out.println("이름 : " + name);
		System.out.print("취미 : ");
		
		for(String res : hobby) {
			System.out.println(res);
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
