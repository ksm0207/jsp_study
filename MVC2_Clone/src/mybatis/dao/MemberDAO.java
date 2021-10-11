package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemberVO;

public class MemberDAO {
	
	public static int add(String member_id , String member_pw , String member_name, String member_phone) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("member_id", member_id);
		map.put("member_pw",member_pw);
		map.put("member_name", member_name);
		map.put("member_phone", member_phone);
		
		int success = sql.insert("member.add",map);
		
		if(success > 0) {
			sql.commit();
		}else {
			sql.rollback();
		}
		sql.close();
		
		return success;
	}
	
	public static MemberVO login(String member_id , String member_pw){
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("member_id",member_id);
		map.put("member_pw",member_pw);
		
		MemberVO mvo = sql.selectOne("member.login",map);
		
		sql.close();
		
		return mvo;
	}
	
	public static boolean checkID(String member_id) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		MemberVO mvo = sql.selectOne("member.check_id",member_id);
		
		boolean check = false;
		
		if(mvo == null) {
			check = true;
		}
		sql.close();
		
		return check;
	
	}
}
