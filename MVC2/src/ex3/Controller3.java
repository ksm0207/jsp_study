package ex3;

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

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.RealType;

/**
 * Servlet implementation class Controller3
 */
@WebServlet(urlPatterns = {"/Controller3"},
 initParams = {
	@WebInitParam(name ="myParam",value="/WEB-INF/action.properties") 
 })
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// �ʱ��Ķ���ͷ� ���޵� action.properties ������ ��θ� ������
	// ������ ������ �����ͼ� ��ü�� �����غ��� ����.
    // ��ü�� �����ϸ� ������ ���� �ʿ��� 
	// ������ Map������ ����ȭ �������Ƿ� Map������ �����Ͽ� �������� ����.
	
	private Map<String,Action> actionMap;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller3() {
        super();
        actionMap = new HashMap<String, Action>();
    }
    
    // ������ �������� ȣ���ϴ� �޼ҵ带 ����.
	@Override
	public void init() throws ServletException {
		
		// ù ��û�ڿ� ���� �� �ѹ��� �����ϴ� ������ ��.
		super.init();
		// ���� ������ �����Ǹ� ���޹��� �ʱ� �Ķ���͸� ������´�.
		// props_path : /WEB-INF/action.properties ��θ� ������
		String props_path = getInitParameter("myParam");
		System.out.println("Props_path : " + props_path);
	
		// ��ü����
		Properties props = new Properties();
		
		// ������ ������ ����� 
		// Properties ��ü�� �Űܳ��� ���ؼ� Stream ��ü�� ������ش�.
		// Properties load �޼ҵ带 �̿��Ͽ� ������ �б� �� �� �ִ�
		FileInputStream fis = null;
		
		
	try {
		// �а�
		fis = new FileInputStream(getPropertiesFile(props_path));
		// �����ϰ�
		props.load(fis); // action.properties������ ������ ��������
						 // Properties ��ü�� K,V ������ �������ش�
						 // �� : greet -> ex3.GreetAction
		System.out.println("�������� : "+ props);
		
		} catch (Exception error) {
			error.printStackTrace();
		}
		
		// ������ ��ü���� ��ΰ� ��� Properties ��ü�� ����Ǿ�����
		// ���� Controller ���忡���� ���� ������ ��ü�� �𸣱⶧����
		// Properties�� ����� Key���� Iterator�� Ȱ���Ͽ� ��ȯ�ϵ��� ����.
		
		// ketSet() �޼ҵ尡 ������ ��ȯ�ϰ� �����߸� �ϴ��� �˻��ؼ� �˾ƺ���.
		// �� iter : greet , hello , now Key���� ����������
	
		Iterator<Object> iter = props.keySet().iterator();
		
		// Key�� ��� ������� ����� Ŭ������θ� �ϳ��� ������ ��ü�� �����غ���.
		// �� ���� actionMap�� �����ϵ��� �ϱ�.
		
		while(iter.hasNext()) {
			// key���� String ������ ����ȯ�� �ʼ�!
			String key = (String)iter.next();
			System.out.println("Key : " + key);
			
			// �� Key �� ����� ���� ����.
			String res = props.getProperty(key);
			System.out.println("Result : " + res);
			
			
			try {
				Object obj = Class.forName(res).newInstance();
				System.out.println("Class.forName = " + obj);
				// Class�� ���� Ŭ������ ��Ȯ�� Ŭ������ ��ΰ� �ִٸ�
				// forName().newInstance()�� ��ü�� ������ �� ����.
				// newInstance()�� ����� ��ü�������� �ϴ°Ͱ� ����. new
				
				// ������ ��ü�� Action���� ����ȯ�Ͽ� map������ ����������.
				actionMap.put(key, (Action)obj);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		};
		
		
	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		// type�� null�̸� �⺻��ü�� �ν��� �� �ֵ��� "greet"�� �־�����
		if(type == null) {
			type = "greet";
		}
		
		// type���� ���� ���� actionMap�� key�� ���ǰ� �����Ƿ�
		// ���ϴ� ��ü�� ����
		Action action = actionMap.get(type);
		
		String viewPath = action.excute(request, response);
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String getPropertiesFile(String path) {
		
		// ���� ������ ��θ� ������ȭ�� �����ش� | ���������� application�� ��������
		ServletContext context = getServletContext();
		String realPath = context.getRealPath(path);
		
		// �����θ� ������� ������ ������ �ִ� ������ �о�÷��� ������־���.
		// �о���� ������� Action �� ���Ͽ� ������ ������� �о������
		// �о���� ������ Properties ��ü�� ����ֵ��� ����.
		try {
			if(realPath.length() > 0 && realPath != null)
				return realPath;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
