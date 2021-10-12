package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

/**
 * Servlet implementation class MemberController
 */
@WebServlet( urlPatterns = {"/MemberController"},
initParams = {
		@WebInitParam(name="param",value="/WEB-INF/prop/member.properties")
})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private Map<String, Action> actionMap;
	
	
    public MemberController() {
        super();
        actionMap = new HashMap<String, Action>();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	
    	Properties props = new Properties();
    	FileInputStream fis = null;
    	
    	String propsPath = getInitParameter("param");
    	
    	ServletContext context = getServletContext();
    	
    	String realPath = context.getRealPath(propsPath);
    	
    	if (realPath != null) {
 
    		try {				
    			fis = new FileInputStream(realPath);
    			props.load(fis);
    			System.out.println("파일 내용 : "+props);
			} catch (Exception e) {
				// TODO: handle exception
			}
    	}
    	
    	Iterator<Object> iter = props.keySet().iterator();
    	
    	while(iter.hasNext()) {
    		
    		String key = (String)iter.next();
    		String value = props.getProperty(key);
    		
    		if(key != null && value != null) {
    			try {
					Object obj = Class.forName(value).newInstance();
					actionMap.put(key, (Action)obj);
   				 
   			} catch (Exception e) {
   				// TODO: handle exception
   			}
		}
			
    		
    	}
    	
    
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("search");
		System.out.println("Parameter : " + param);
		if(param == null) {
			param = "index";
		}
		String location = "";
		
		Action action = actionMap.get(param);
		
		location = action.getList(request, response);
		System.out.println(location);
		
		RequestDispatcher dis = request.getRequestDispatcher(location);
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
