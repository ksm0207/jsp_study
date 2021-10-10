package mybatis.service;

import java.io.Reader;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.io.Resources;

public class FactoryService {
	
	private static SqlSessionFactory factory;
	
	static {
		try {
			
			Reader read = Resources.getResourceAsReader("mybatis/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(read);
            
			System.out.println("DB on ");
			read.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
