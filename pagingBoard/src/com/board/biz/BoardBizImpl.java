package com.board.biz;

import java.util.List;

import com.board.dao.BoardDao;
import com.board.dao.BoardDaoImpl;
import com.board.dto.BoardDto;
import com.board.dto.PagingDto;

public class BoardBizImpl implements BoardBiz {

	private BoardDao dao = new BoardDaoImpl();
	
	@Override
	public List<BoardDto> selectAll(PagingDto dto) {
		int currentpage = dto.getCurrentpage();
		int totalrows = dto.getTotalrows();
		
		int to = totalrows * (currentpage -1)+1;
		int from = totalrows * currentpage;
		
		return dao.selectAll(to, from);
	}

	@Override
	public int totalPage(int totalrows) {
		int totalpage = (int)Math.ceil((double)dao.totalPage()/totalrows);
		
		return totalpage;
	}

}
