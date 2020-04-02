package com.md.dao;
import java.util.HashMap;
import java.util.List;
//import에 static을 붙이면 class를 생략하고 메소드만 사용할 수 있다.static 없는 경우엔 class.method로 호출해야함
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.md.dto.MDBoardDto;

public class MDBoardDao extends SqlMapconfig{

	private String namespace="muldel.";
	
	public List<MDBoardDto> selectList(){
		
		List<MDBoardDto> list = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	
	public MDBoardDto selectOne(int seq){
		MDBoardDto dto = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectOne",seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}
	
	public int insert(MDBoardDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"insert",dto);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
			
		}
		
		return res;
	}
	
	public int update(MDBoardDto dto) {
		
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"update",dto);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
	public int delete(int seq) {
		int res = 0;
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace+"delete",seq);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;	
		
	}
	
	public int multiDelete(String[] seq) {
		int res = 0;
		
		SqlSession session = null;
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seq);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"muldel",map);
		
			if(res == seq.length) {
				session.commit();
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
}
