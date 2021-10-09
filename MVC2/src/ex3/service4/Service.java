package ex3.service4;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Service {
	
	private static SqlSessionFactory factory;
	
	// Static �ʱ�ȭ ����
	static {
		try {
			Reader reader = Resources.getResourceAsReader("ex3/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("DB on");
			
			reader.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		
		return factory;
	}

}