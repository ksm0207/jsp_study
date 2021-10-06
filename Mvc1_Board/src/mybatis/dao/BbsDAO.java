package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service3.Service;
import mybatis.vo.BbsVO;
import mybatis.vo.CommentVO;
import oracle.net.jdbc.TNSAddress.SOException;

public class BbsDAO {
	
	// 목록
	public static BbsVO[] getList(int begin, int end) {
		
		BbsVO[] arr = null;
		
		SqlSession session = Service.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("begin", begin);
		map.put("end",end);
		
		List<BbsVO> list = session.selectList("bbs.bbs_list",map);
		
		if(list != null && !list.isEmpty()) {
			
			arr = new BbsVO[list.size()];
			list.toArray(arr); // list -> BbsVO 내용복사.
		}
		session.close();
		
		return arr;
	}
	
	// 총 게시물 수
	public static int getTotalCount() {
		
		SqlSession session = Service.getFactory().openSession();
		
		int total_page = session.selectOne("bbs.total_count");
		
		session.close();
		
		return total_page;
	}
	
	// title, writer, content, file
	public static int createData(String title, String writer, String content, String file_name,String ip,String pwd){

		Map<String,String> map = new HashMap<String, String>();
		
		map.put("subject",title);
		map.put("writer",writer);
		map.put("content",content);
		map.put("file_name",file_name);
		map.put("ip",ip);
		map.put("pwd",pwd);
	
		SqlSession session = Service.getFactory().openSession();
		
		int res = session.insert("bbs.add",map);
		
		if(res > 0) {
		session.commit();
		}else {
		session.rollback();
		}
		session.close();
		
		
		return res;
	}
	
	public static BbsVO search(int b_idx) {
		
		SqlSession session = Service.getFactory().openSession();
		
		BbsVO vo = session.selectOne("bbs.search",b_idx);
		
		session.close();
		
		return vo;
	}
	
	public static int addAns(CommentVO cvo) {
		
		SqlSession session = Service.getFactory().openSession(true);
		
		int status = session.insert("bbs.ans",cvo);
		
		if(status > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		
		return status;
	}
	
	public static int updateBoard(String title, String writer, String content,String b_idx,String pwd) {
		
		SqlSession session = Service.getFactory().openSession();
		
		Map<String,String> map = new HashMap<String, String>();
		
		
		map.put("subject",title);
		map.put("writer",writer);
		map.put("content",content);
		map.put("b_idx",b_idx);
		map.put("pwd",pwd);
		
		
		int value = session.update("bbs.update",map);
		
		if(value > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		
		return value;
	}
	
	public static int setBoardHit(String idx) {
		
		SqlSession session = Service.getFactory().openSession();
		
		int hit = session.update("bbs.hit",idx);
		
		if(hit > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		System.out.println("idx : " + idx);
		session.close();
		
		return hit;
	}
}
