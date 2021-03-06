package mybatis.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BbsVO {

	private String b_idx;
	private String subject;
	private String writer;
	private String content;
	private String file_name;
	private String ori_name;
	private String write_date;
	private String ip;
	private int hit;
	private int status;
	
	private List<CommentVO> cvo_list; // 해당 글의 있는 댓글들이 저장관리를 하는 리스트
	                                      // mybatis - resultMap에 데이터가 오게끔 해야함!

	
	public String getB_idx() {
		return b_idx;
	}

	public List<CommentVO> getCvo_list() {
		return cvo_list;
	}

	public void setCvo_list(List<CommentVO> cvo_list) {
		this.cvo_list = cvo_list;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getWrite_date() {
	
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
		
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
	
	
	
}
