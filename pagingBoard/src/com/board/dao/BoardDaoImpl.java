package com.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.board.dto.PagingDto;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {

	private String namespace = "bdLink.";
	

	@Override
	public int totalPage() {	// 총 게시물의 수를 구하기 위해서
		
		int totalpage = 0;
		SqlSession session = null;
		
		try {
			session = getsqlSessionFactory().openSession();
			totalpage = session.selectOne(namespace+"totalPage");
			
			if(totalpage>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}

		
		return totalpage;
	}

	@Override
	public List<BoardDto> selectAll(int to, int from) {

		List<BoardDto> list = null;
		SqlSession session = null;
		PagingDto dto = new PagingDto();
			dto.setTo(to);
			dto.setFrom(from);
		
		try {
			session = getsqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectList",dto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

}
