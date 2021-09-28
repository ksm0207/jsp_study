package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.Service;
import mybatis.vo.MemVO;


public class MemDAO {

		// 회원가입 기능 메소드
		// return : 0 or 1
		// 1 : 성공 0 : 실패
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
	
	// DB에 접근하여 로그인을 처리하는 비즈니스 로직
	public static MemVO login(String m_id , String m_pw) {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("m_id",m_id);
		map.put("m_pw",m_pw);
		
		SqlSession session = Service.getFactory().openSession();
		
		MemVO mvo = session.selectOne("mem.login",map);
		
		session.close();
		
		return mvo;
	}
	
	// 아이디 체크 메소드
	public static boolean checkID(String id) {
		boolean flag = false;
		
		SqlSession session = Service.getFactory().openSession();
	
		MemVO mvo = session.selectOne("mem.checkID",id);
		
		// 같은 아이디가 없을 때만  flag에 true를 넣어주기.
		if(mvo == null) {
			flag = true;
		}
		
		session.close();
		
		return flag;
	}
	
}







