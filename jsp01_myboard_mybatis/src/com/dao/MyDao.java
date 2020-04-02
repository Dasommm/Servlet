package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.dto.MyDto;

public class MyDao {

	
	public List<MyDto> selectList(){
		String resource = "com/my/db/mybatis.config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession session = sqlSessionFactory.openSession();
		List<MyDto> list = session.selectList("com.my.mapper.selectList");
		session.close();
		
		return list;
	}
	
	public MyDto selectOne(int myNo) {
		
		String resource="com/my/db/mybatis.config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession session = sqlSessionFactory.openSession();
		MyDto dto = session.selectOne("com.my.mapper.selectOne",myNo);
		
		session.close();	
		
		return dto;
	}
	
	public int insert(MyDto dto) {
		
		String resource = "com/my/db/mybatis.config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession session = sqlSessionFactory.openSession();
		
		int res = session.insert("com.my.mapper.insert",dto);
		
		if(res>0) {
			session.commit();
		}
		session.close();
		
		
		return res;
	}
	
	public int update(MyDto dto) {
		String resource ="com/my/db/mybatis.config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession(true); //openSession(boolean type, auto commit된다. default false)
		
		int res = session.update("com.my.mapper.update",dto);
		session.close();
		
		
		return res;
	}
	
	public int delete(int myNo) {
		String resource = "com/my/db/mybatis.config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		
		int res = session.delete("com.my.mapper.delete",myNo);
		
		if(res>0) {
			session.commit();
		}
		session.close();
		
		return res;
	}
	
	
}
