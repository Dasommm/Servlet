package com.mvc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mvc.dto.MyDto;

public class MyDaoImpl extends SqlMapConfig implements MyDao {

	private String namespace = "mvc.";
	
	@Override
	public List<MyDto> selectList() {
		
		List<MyDto> list = null;
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

	@Override
	public MyDto selectOne(int seq) {
		
		MyDto dto = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectOne");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}

	@Override
	public int insert(MyDto dto) {

		
		return 0;
	}

	@Override
	public int update(MyDto dto) {

		
		return 0;
	}

	@Override
	public int delete(int seq) {

		return 0;
	}

}
