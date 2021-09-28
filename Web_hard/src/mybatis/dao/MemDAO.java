package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.Service;
import mybatis.vo.MemVO;


public class MemDAO {

		// ȸ������ ��� �޼ҵ�
		// return : 0 or 1
		// 1 : ���� 0 : ����
	public static int registry(String m_id , String m_pw , String m_name, String m_email) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("m_id",m_id);
		map.put("m_pw",m_pw);
		map.put("m_name",m_name);
		map.put("m_email",m_email);
		
		SqlSession session = Service.getFactory().openSession();
		
		int res = session.insert("mem.add",map);
		
		if(res > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		
		return res;
	}
	
	// DB�� �����Ͽ� �α����� ó���ϴ� ����Ͻ� ����
	public static MemVO login(String m_id , String m_pw) {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("m_id",m_id);
		map.put("m_pw",m_pw);
		
		SqlSession session = Service.getFactory().openSession();
		
		MemVO mvo = session.selectOne("mem.login",map);
		
		session.close();
		
		return mvo;
	}
	
	// ���̵� üũ �޼ҵ�
	public static boolean checkID(String id) {
		boolean flag = false;
		
		SqlSession session = Service.getFactory().openSession();
	
		MemVO mvo = session.selectOne("mem.checkID",id);
		
		// ���� ���̵� ���� ����  flag�� true�� �־��ֱ�.
		if(mvo == null) {
			flag = true;
		}
		
		session.close();
		
		return flag;
	}
	
}







